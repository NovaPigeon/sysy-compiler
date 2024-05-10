#include <cassert>
#include <cstdio>
#include <iostream>
#include <memory>
#include <string>
#include <string.h>
#include <sstream>
#include <map>
#include "koopa.h"
#include "riscv.h"


static const std::string regs_name[REG_NUM+1]=
{
    "t0","t1","t2","t3","t4","t5","t6",
    "a0","a1","a2","a3","a4","a5","a6","a7","x0"
};
static std::string gen_reg(int id)
{
    if (id <= REG_NUM)
        return regs_name[id];
    return "t0";
}

static std::map<koopa_raw_binary_op_t, std::string> op_names = 
{
    {KOOPA_RBO_GT, "sgt"},
    {KOOPA_RBO_LT, "slt"},
    {KOOPA_RBO_ADD, "add"},
    {KOOPA_RBO_SUB, "sub"},
    {KOOPA_RBO_MUL, "mul"},
    {KOOPA_RBO_DIV, "div"},
    {KOOPA_RBO_MOD, "rem"},
    {KOOPA_RBO_AND, "and"},
    {KOOPA_RBO_OR, "or"}
};

static std::map<koopa_raw_value_t,var_info_t> is_visited;
static StackFrame stack_frame;
static RegManager reg_manager;


// 访问 raw program
void Visit(const koopa_raw_program_t &program)
{
    dbg_rscv_printf("Visit program\n");
    // 访问所有全局变量
    Visit(program.values);
    std::cout << "  .text"<<std::endl;
    // 访问所有函数
    Visit(program.funcs);
}

// 访问 raw slice
void Visit(const koopa_raw_slice_t &slice)
{
    dbg_rscv_printf("Visit slice\n");
    for (size_t i = 0; i < slice.len; ++i)
    {
        auto ptr = slice.buffer[i];
        // 根据 slice 的 kind 决定将 ptr 视作何种元素
        switch (slice.kind)
        {
        case KOOPA_RSIK_FUNCTION:
            // 访问函数
            Visit(reinterpret_cast<koopa_raw_function_t>(ptr));
            break;
        case KOOPA_RSIK_BASIC_BLOCK:
            // 访问基本块
            Visit(reinterpret_cast<koopa_raw_basic_block_t>(ptr));
            break;
        case KOOPA_RSIK_VALUE:
            // 访问指令
            Visit(reinterpret_cast<koopa_raw_value_t>(ptr));
            break;
        default:
            // 我们暂时不会遇到其他内容, 于是不对其做任何处理
            assert(false);
        }
    }
}
void Prologue(const koopa_raw_function_t &func)
{
    std::cout<<std::endl<<"  # prologue"<<std::endl;
    int stack_size=0;
    for(uint32_t i=0;i<func->bbs.len;++i)
    {
        koopa_raw_basic_block_t bb=reinterpret_cast<koopa_raw_basic_block_t>(func->bbs.buffer[i]);
        for(uint32_t j=0;j<bb->insts.len;++j)
        {
            koopa_raw_value_t inst=reinterpret_cast<koopa_raw_value_t>(bb->insts.buffer[j]);
            if(inst->ty->tag!=KOOPA_RTT_UNIT)
                stack_size=stack_size+4;
        }
    }
    stack_size=(stack_size+15)&(~15);
    stack_frame.set_stack_size(stack_size);
    if(stack_size<MAX_IMMEDIATE_VAL)
    {
        std::cout<<"  addi sp, sp, "<<-stack_size<<std::endl;
    }
    else
    {
        std::cout<<"  li t0, "<<-stack_size<<std::endl;
        std::cout<<"  addi sp, sp, t0"<<std::endl;
    }

}
// 访问函数
void Visit(const koopa_raw_function_t &func)
{
    dbg_rscv_printf("Visit func\n");
    std::string func_name = std::string(func->name + 1);
    std::cout<< "  .globl " << func_name <<std::endl;
    std::cout<< func_name <<":"<<std::endl;
    Prologue(func);
    // 访问所有基本块
    Visit(func->bbs);
}

// 访问基本块
void Visit(const koopa_raw_basic_block_t &bb)
{
    dbg_rscv_printf("Visit basic block\n");
    // 访问所有指令
    std::cout << bb->name + 1 << ":" << std::endl;
    Visit(bb->insts);
}

// 访问指令
var_info_t Visit(const koopa_raw_value_t &value)
{
    dbg_rscv_printf("Visit value\n");
    if(is_visited.find(value)!=is_visited.end())
    {
        var_info_t info=is_visited[value];
        if(info.type==VAR_TYPE::ON_REG)
            return info;
        else if(info.type==VAR_TYPE::ON_STACK)
        {
            int location=info.stack_location;
            assert(location>=0);
            int reg_id=reg_manager.alloc_reg();
            std::cout<<"  lw "<<gen_reg(reg_id)<<", "<<location<<"(sp)"<<std::endl;
            info.type=VAR_TYPE::ON_REG;
            info.reg_id=reg_id;
            return info;
        }
        
    }

    // 根据指令类型判断后续需要如何访问
    const auto &kind = value->kind;
    var_info_t vinfo;
    
    switch (kind.tag)
    {
    case KOOPA_RVT_RETURN:
        // 访问 return 指令
        Visit(kind.data.ret);
        reg_manager.free_regs();
        break;
    case KOOPA_RVT_INTEGER:
        // 访问 integer 指令
        vinfo=Visit(kind.data.integer);
        break;
    case KOOPA_RVT_BINARY:
        // 访问 binary 指令
        vinfo=Visit(kind.data.binary);
        is_visited[value]=vinfo;
        reg_manager.free_regs();
        break;
    case KOOPA_RVT_ALLOC:
        std::cout <<std::endl<< "  # alloc" << std::endl;
        vinfo.type=VAR_TYPE::ON_STACK;
        vinfo.stack_location=stack_frame.push();
        is_visited[value]=vinfo;
        reg_manager.free_regs();
        break;
    case KOOPA_RVT_BRANCH:
        Visit(kind.data.branch);
        break;
    case KOOPA_RVT_JUMP:
        Visit(kind.data.jump);
        break;
    case KOOPA_RVT_STORE:
        Visit(kind.data.store);
        reg_manager.free_regs();
        break;
    case KOOPA_RVT_LOAD:
        vinfo = Visit(kind.data.load);
        is_visited[value]=vinfo;
        reg_manager.free_regs();
        break;
    default:
        // 其他类型暂时遇不到
        assert(false);
    }
    return vinfo;
}

void Epilogue()
{
    std::cout<<std::endl<<"  # epilogue"<<std::endl;
    int stack_size=stack_frame.get_stack_size();
    if (stack_size < MAX_IMMEDIATE_VAL)
    {
        std::cout << "  addi sp, sp, " << stack_size << std::endl;
    }
    else
    {
        std::cout << "  li t0, " << stack_size << std::endl;
        std::cout << "  addi sp, sp, t0" << std::endl;
    }
}

// 访问对应类型指令的函数定义略
// 视需求自行实现
// ...
// 访问 return
void Visit(const koopa_raw_return_t &ret)
{
    dbg_rscv_printf("Visit return\n");
    std::cout << std::endl
              << "  # ret" << std::endl;
    koopa_raw_value_t val = ret.value;
    var_info_t var=Visit(val);
    assert(var.type==VAR_TYPE::ON_REG);
    std::cout<<"  mv a0, "<<gen_reg(var.reg_id)<<std::endl;
    Epilogue();
    std::cout<<"  ret"<<std::endl;
    
}

// 访问 integer 指令
var_info_t Visit(const koopa_raw_integer_t &interger)
{
    dbg_rscv_printf("Visit integer\n");
    int32_t val = interger.value;
    var_info_t vinfo;
    vinfo.type=VAR_TYPE::ON_REG;
    if(val==0)
    {
        vinfo.reg_id=ZERO_REG_ID;
        return vinfo;
    }
    int new_reg_id=reg_manager.alloc_reg();
    vinfo.reg_id=new_reg_id;
    std::string reg = gen_reg(new_reg_id);
    std::cout<<"  li "<<reg<<", "<<std::to_string(val)<<std::endl;
    return vinfo;
}

var_info_t Visit(const koopa_raw_binary_t &binary)
{
    dbg_rscv_printf("Visit binary\n");
    std::cout << std::endl
              << "  # binary" << std::endl;

    var_info_t lvar=Visit(binary.lhs);
    var_info_t rvar=Visit(binary.rhs);
    
    if(lvar.type==VAR_TYPE::ON_STACK)
    {
        lvar.type=VAR_TYPE::ON_REG;
        lvar.reg_id=reg_manager.alloc_reg();
        std::cout<<"  lw "<<gen_reg(lvar.reg_id)<<", "<<lvar.stack_location<<"(sp)"<<std::endl;
    }
    if (rvar.type == VAR_TYPE::ON_STACK)
    {
        rvar.type = VAR_TYPE::ON_REG;
        rvar.reg_id = reg_manager.alloc_reg();
        std::cout << "  lw " << gen_reg(rvar.reg_id) << ", " << lvar.stack_location << "(sp)" << std::endl;
    }

    var_info_t tmp_result;
    tmp_result.type=VAR_TYPE::ON_REG;
    tmp_result.reg_id=reg_manager.alloc_reg();
    
    std::string new_reg=gen_reg(tmp_result.reg_id),
                l_reg=gen_reg(lvar.reg_id),
                r_reg=gen_reg(rvar.reg_id);
    koopa_raw_binary_op_t op = binary.op;
    switch (op)
    {
    case KOOPA_RBO_GT:
    case KOOPA_RBO_LT:
    case KOOPA_RBO_ADD:
    case KOOPA_RBO_SUB:
    case KOOPA_RBO_MUL:
    case KOOPA_RBO_DIV:
    case KOOPA_RBO_MOD:
    case KOOPA_RBO_AND:
    case KOOPA_RBO_OR:
        std::cout << "  " <<op_names[op] << " " <<new_reg<< ", " <<l_reg<< ", " << r_reg<<std::endl;
        break;
    case KOOPA_RBO_EQ:
        std::cout<< "  xor " << new_reg << ", " << l_reg << ", " << r_reg << std::endl;
        std::cout<< "  seqz " << new_reg << ", " << new_reg <<std::endl;
        break;
    case KOOPA_RBO_NOT_EQ:
        std::cout<< "  xor " <<new_reg << ", " << l_reg << ", " << r_reg << std::endl;
        std::cout<< "  snez " << new_reg << ", " << new_reg << std::endl;;
        break;
    case KOOPA_RBO_LE:  
        std::cout<<"  sgt "<<new_reg<<", "<<l_reg<<", "<<r_reg<<std::endl;
        std::cout<<"  xori "<<new_reg<<", "<<new_reg<<", 1"<<std::endl;
        break;
    case KOOPA_RBO_GE:
        std::cout << "  slt " << new_reg << ", " << l_reg << ", " << r_reg << std::endl;
        std::cout << "  xori " << new_reg << ", " << new_reg << ", 1" << std::endl;
    }
    
    var_info_t res;
    res.type=VAR_TYPE::ON_STACK;
    res.stack_location=stack_frame.push();
    std::cout<<"  sw "<<new_reg<<", "<<res.stack_location<<"(sp)"<<std::endl;
    return res;
}

void Visit(const koopa_raw_store_t &store)
{
    dbg_rscv_printf("Visit store\n");
    std::cout << std::endl
              << "  # store" << std::endl;
    koopa_raw_value_t dst=store.dest;
    assert(is_visited.find(dst)!=is_visited.end());

    var_info_t dst_var=is_visited[dst];
    assert(dst_var.type == VAR_TYPE::ON_STACK);
    
    var_info_t src_var=Visit(store.value);
    assert(src_var.type==VAR_TYPE::ON_REG);

    std::cout<<"  sw "<<gen_reg(src_var.reg_id)<<", "<<dst_var.stack_location<<"(sp)"<<std::endl;

}

var_info_t Visit(const koopa_raw_load_t &load)
{
    dbg_rscv_printf("Visit load\n");
    std::cout << std::endl
              << "  # load" << std::endl;
    var_info_t src_var=Visit(load.src);
    assert(src_var.type==VAR_TYPE::ON_REG);
    var_info_t dst_var;
    dst_var.type=VAR_TYPE::ON_STACK;
    dst_var.stack_location=stack_frame.push();
    std::cout<<"  sw "<<gen_reg(src_var.reg_id)<<", "<<dst_var.stack_location<<"(sp)"<<std::endl;
    return dst_var;
}

void Visit(const koopa_raw_branch_t &branch)
{
    dbg_rscv_printf("Visit branch\n");
    std::cout << std::endl
              << "  # branch" << std::endl;
    std::string label_true=branch.true_bb->name+1;
    std::string label_false=branch.false_bb->name+1;
    var_info_t var=Visit(branch.cond);
    reg_manager.free_regs();
    std::string var_name;
    if(var.type==VAR_TYPE::ON_REG)
        var_name=gen_reg(var.reg_id);
    else
        var_name=std::to_string(var.stack_location)+"(sp)";

    std::cout << "  bnez  " << var_name << ", " << label_true
              << std::endl;
    std::cout << "  j     " << label_false << std::endl;
}

void Visit(const koopa_raw_jump_t &jump)
{
    dbg_rscv_printf("Visit jump\n");
    std::cout << std::endl
              << "  # jump" << std::endl;
    std::string label_target = jump.target->name + 1;
    std::cout << "  j     " << label_target << std::endl;
    reg_manager.free_regs();
}