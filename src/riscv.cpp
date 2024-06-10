#include <cassert>
#include <cstdio>
#include <iostream>
#include <memory>
#include <string>
#include <string.h>
#include <sstream>
#include<vector>
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
    assert(false);
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
static int global_cnt=0;
static std::vector<int> aggregate_vals;
static int branch_cnt=0;


static void GenLoadStoreInst(std::string op,std::string reg1,int imm,std::string reg2)
{
    if(abs(imm)<MAX_IMMEDIATE_VAL)
    {
        std::cout<<"  "<<op<<" "<<reg1<<", "<<imm<<"("<<reg2<<")"<<std::endl;
    }
    else
    {
        int reg_id=reg_manager.alloc_reg();
        std::string reg_tmp=gen_reg(reg_id);
        std::cout<<"  li "<<reg_tmp<<", "<<imm<<std::endl;
        std::cout<<"  add "<<reg_tmp<<", "<<reg_tmp<<", "<<reg2<<std::endl;
        std::cout << "  " << op << " " << reg1 << ", " << 0 << "(" << reg_tmp << ")" << std::endl;
        reg_manager.free(reg_id);
    }
}
static void GenAddInst(std::string src_reg,std::string dest_reg,int imm)
{
    if (abs(imm) < MAX_IMMEDIATE_VAL)
    {
        std::cout << "  addi "  << dest_reg << ", " << src_reg << ", " << imm << std::endl;
    }
    else
    {
        int reg_id = reg_manager.alloc_reg();
        std::string reg_tmp = gen_reg(reg_id);
        std::cout << "  li " << reg_tmp << ", " << imm << std::endl;
        std::cout << "  add " << dest_reg << ", " << reg_tmp << ", " << src_reg << std::endl;
        reg_manager.free(reg_id);
    }
}

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
    bool store_ra=false;
    int max_args_num=0;
    for(uint32_t i=0;i<func->bbs.len;++i)
    {
        koopa_raw_basic_block_t bb=reinterpret_cast<koopa_raw_basic_block_t>(func->bbs.buffer[i]);
        for(uint32_t j=0;j<bb->insts.len;++j)
        {
            koopa_raw_value_t inst=reinterpret_cast<koopa_raw_value_t>(bb->insts.buffer[j]);
            if(inst->ty->tag!=KOOPA_RTT_UNIT)
            {
                if(inst->kind.tag==KOOPA_RVT_ALLOC)
                    stack_size+=get_var_size(inst->ty->data.pointer.base);
                else
                    stack_size=stack_size+4;
            }
            if(inst->kind.tag==KOOPA_RVT_CALL)
            {
                store_ra=true;
                int args_num=inst->kind.data.call.args.len;
                if(args_num>max_args_num)
                    max_args_num=args_num;
            }
        }
    }

    if(store_ra)
        stack_size+=4;
    if(max_args_num>8)
        stack_size+=(max_args_num-8)*4;
    
    stack_size=(stack_size+15)&(~15);

    stack_frame.set_stack_size(stack_size,store_ra,max_args_num);
    if(stack_size<MAX_IMMEDIATE_VAL)
    {
        std::cout<<"  addi sp, sp, "<<-stack_size<<std::endl;
    }
    else
    {
        std::cout<<"  li t0, "<<-stack_size<<std::endl;
        std::cout<<"  add sp, sp, t0"<<std::endl;
    }

    if(store_ra)
        GenLoadStoreInst("sw","ra",stack_size-4,"sp");
    
    for(int i=0;i<func->params.len;++i)
    {
        
        koopa_raw_value_t param = reinterpret_cast<koopa_raw_value_t>(func->params.buffer[i]);
        var_info_t param_info;
        if(i<PARAM_REG_NUM)
        {
            param_info.type=VAR_TYPE::ON_REG;
            param_info.reg_id=(i+7);
        }
        else
        {
            param_info.type=VAR_TYPE::ON_STACK;
            param_info.stack_location=stack_size+(i-8)*4;
        }
        is_visited[param]=param_info;
    }

}
// 访问函数
void Visit(const koopa_raw_function_t &func)
{
    dbg_rscv_printf("Visit func\n");
    if(func->bbs.len==0)
        return;
    std::string func_name = std::string(func->name + 1);
    std::cout<< "  .globl " << func_name <<std::endl;
    std::cout<< func_name <<":"<<std::endl;
    Prologue(func);
    // 访问所有基本块
    Visit(func->bbs);
    std::cout<<std::endl;
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
            GenLoadStoreInst("lw", gen_reg(reg_id), location, "sp");
            
            info.type=VAR_TYPE::ON_REG;
            info.reg_id=reg_id;
            return info;
        }
        else if (info.type==VAR_TYPE::ON_GLOBAL)
        {
            int reg_id = reg_manager.alloc_reg();

            std::cout << "  la " << gen_reg(reg_id) << ", " << is_visited[value].global_name << std::endl;
            std::cout << "  lw " << gen_reg(reg_id) << ", 0(" << gen_reg(reg_id) << ")" << std::endl;
            info.type = VAR_TYPE::ON_REG;
            info.reg_id = reg_id;
            return info;
        }
    }

    // 根据指令类型判断后续需要如何访问
    const auto &kind = value->kind;
    var_info_t vinfo;
    bool is_ret = (value->ty->tag != KOOPA_RTT_UNIT);
    int var_size=4;
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
        var_size=get_var_size(value->ty->data.pointer.base);
        vinfo.stack_location=stack_frame.push(var_size);
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
    case KOOPA_RVT_CALL:
        vinfo=Visit(kind.data.call,is_ret);
        is_visited[value]=vinfo;
        reg_manager.free_regs();
        break;
    case KOOPA_RVT_GLOBAL_ALLOC:
        vinfo=Visit(kind.data.global_alloc);
        assert(vinfo.type==VAR_TYPE::ON_GLOBAL);
        is_visited[value]=vinfo;
        break;
    case KOOPA_RVT_GET_ELEM_PTR:
        vinfo=Visit(kind.data.get_elem_ptr);
        is_visited[value]=vinfo;
        reg_manager.free_regs();
        break;
    case KOOPA_RVT_GET_PTR:
        vinfo=Visit(kind.data.get_ptr);
        is_visited[value]=vinfo;
        reg_manager.free_regs();
        break;
    default:
        // 其他类型暂时遇不到
        printf("RVT type %d do not support.\n",kind.tag);
        assert(false);
    }
    return vinfo;
}

void Epilogue()
{
    std::cout<<std::endl<<"  # epilogue"<<std::endl;
    int stack_size=stack_frame.get_stack_size();
    bool store_ra=stack_frame.is_store_ra();
    if(store_ra)
        GenLoadStoreInst("lw","ra",stack_size-4,"sp");
    
    if (stack_size < MAX_IMMEDIATE_VAL)
    {
        std::cout << "  addi sp, sp, " << stack_size << std::endl;
    }
    else
    {
        std::cout << "  li t0, " << stack_size << std::endl;
        std::cout << "  add sp, sp, t0" << std::endl;
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
    if(val)
    {
        var_info_t var=Visit(val);
        assert(var.type==VAR_TYPE::ON_REG);
        std::cout<<"  mv a0, "<<gen_reg(var.reg_id)<<std::endl;
    }
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
        GenLoadStoreInst("lw", gen_reg(lvar.reg_id),lvar.stack_location,"sp");
    }
    if (rvar.type == VAR_TYPE::ON_STACK)
    {
        rvar.type = VAR_TYPE::ON_REG;
        rvar.reg_id = reg_manager.alloc_reg();
        GenLoadStoreInst("lw", gen_reg(rvar.reg_id), rvar.stack_location, "sp");
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
    GenLoadStoreInst("sw",new_reg,res.stack_location,"sp");
    return res;
}

void Visit(const koopa_raw_store_t &store)
{
    dbg_rscv_printf("Visit store\n");
    std::cout << std::endl
              << "  # store" << std::endl;
    koopa_raw_value_t dst=store.dest;
    assert(is_visited.find(dst)!=is_visited.end());

    var_info_t src_var = Visit(store.value);
    assert(src_var.type == VAR_TYPE::ON_REG);

    var_info_t dst_var;
    if(dst->kind.tag==KOOPA_RVT_GLOBAL_ALLOC)
    {
        dst_var = is_visited[store.dest];
        int reg_id=reg_manager.alloc_reg();
        std::cout<<"  la "<<gen_reg(reg_id)<<", "<<dst_var.global_name<<std::endl;
        std::cout<<"  sw "<<gen_reg(src_var.reg_id)<<", 0("<<gen_reg(reg_id)<<")"<<std::endl;
    }
    else if(dst->kind.tag==KOOPA_RVT_GET_ELEM_PTR ||
            dst->kind.tag==KOOPA_RVT_GET_PTR)
    {
        dst_var=Visit(store.dest);
        std::cout<<"  sw "<<gen_reg(src_var.reg_id)<<", ("<<gen_reg(dst_var.reg_id)<<")"<<std::endl;
    }
    else
    {
        dst_var = is_visited[store.dest];
        GenLoadStoreInst("sw", gen_reg(src_var.reg_id),dst_var.stack_location,"sp");
    }
}

var_info_t Visit(const koopa_raw_load_t &load)
{
    dbg_rscv_printf("Visit load\n");
    std::cout << std::endl
              << "  # load" << std::endl;

    var_info_t src_var=Visit(load.src);
    assert(src_var.type==VAR_TYPE::ON_REG);
    int src_reg=src_var.reg_id;
    if(load.src->kind.tag==KOOPA_RVT_GET_ELEM_PTR || 
       load.src->kind.tag==KOOPA_RVT_GET_PTR)
    {
        src_reg=reg_manager.alloc_reg();
        std::cout<<"  lw "<<gen_reg(src_reg)<<", ("<<gen_reg(src_var.reg_id)<<")"<<std::endl;
    }
    var_info_t dst_var;
    dst_var.type=VAR_TYPE::ON_STACK;
    dst_var.stack_location=stack_frame.push();
    GenLoadStoreInst("sw", gen_reg(src_reg), dst_var.stack_location, "sp");
    return dst_var;
}

void Visit(const koopa_raw_branch_t &branch)
{
    dbg_rscv_printf("Visit branch\n");
    std::cout << std::endl
              << "  # branch" << std::endl;
    std::string label_true=branch.true_bb->name+1;
    std::string label_false=branch.false_bb->name+1;
    std::string label_inter="inter_label_"+std::to_string(branch_cnt);
    branch_cnt++;
    var_info_t var=Visit(branch.cond);
    std::string var_name;
    if(var.type==VAR_TYPE::ON_REG)
        var_name=gen_reg(var.reg_id);
    else
        var_name=std::to_string(var.stack_location)+"(sp)";

    std::cout << "  bnez  " << var_name << ", " << label_inter
              << std::endl;
    int new_reg = reg_manager.alloc_reg();
    std::cout << "  la " << gen_reg(new_reg) << ", " << label_false << std::endl;
    std::cout << "  jr " << gen_reg(new_reg) << std::endl;
    
    std::cout<<label_inter<<":"<<std::endl;

    new_reg = reg_manager.alloc_reg();
    std::cout << "  la " << gen_reg(new_reg) << ", " << label_true << std::endl;
    std::cout << "  jr " << gen_reg(new_reg) << std::endl;

    reg_manager.free_regs();
}

void Visit(const koopa_raw_jump_t &jump)
{
    dbg_rscv_printf("Visit jump\n");
    std::cout << std::endl
              << "  # jump" << std::endl;
    std::string label_target = jump.target->name + 1;
    int new_reg = reg_manager.alloc_reg();
    std::cout << "  la " << gen_reg(new_reg) << ", " << label_target << std::endl;
    std::cout << "  jr " << gen_reg(new_reg) << std::endl;
    reg_manager.free_regs();
}

var_info_t Visit(const koopa_raw_call_t &call,bool is_ret)
{
    dbg_rscv_printf("Visit func\n");
    std::cout << std::endl
              << "  # func" << std::endl;
    
    reg_manager.free_regs();
    for(int i=0;i<call.args.len;++i)
    {
        koopa_raw_value_t arg=reinterpret_cast<koopa_raw_value_t>(call.args.buffer[i]);
        var_info_t info=Visit(arg);
        if(i<PARAM_REG_NUM)
        {
            if(i+7!=info.reg_id)
            {
                reg_manager.alloc_reg(i+7);
                std::cout<<"  mv "<<gen_reg(i+7)<<", "<<gen_reg(info.reg_id)<<std::endl;
                reg_manager.free(info.reg_id);
            }
        }
        else
        {   
            GenLoadStoreInst("sw",gen_reg(info.reg_id),(i-8)*4,"sp");
            reg_manager.free(info.reg_id);
        }
        
    }

    std::cout<<"  call "<<call.callee->name+1<<std::endl;

    var_info_t info;
    if(is_ret)
    {
        info.type=VAR_TYPE::ON_STACK;
        info.stack_location=stack_frame.push();
        GenLoadStoreInst("sw","a0",info.stack_location,"sp");
    }
    return info;
}

var_info_t Visit(const koopa_raw_global_alloc_t &global_alloc)
{
    dbg_rscv_printf("Visit global alloc\n");
    std::string gname="g_"+std::to_string(global_cnt);
    global_cnt++;
    std::cout << std::endl
              << "  # global alloc" << std::endl;

    std::cout << "  .data" << std::endl;
    std::cout << "  .globl " <<gname<<std::endl;
    std::cout<<gname<<":"<<std::endl;

    const auto &kind = global_alloc.init->kind.tag;
    switch (kind)
    {
        case KOOPA_RVT_ZERO_INIT:
            std::cout<<"  .zero "<<get_var_size(global_alloc.init->ty)<<std::endl;
            break;
        case KOOPA_RVT_INTEGER:
            std::cout<<"  .word "<<global_alloc.init->kind.data.integer.value<<std::endl;
            break;
        case KOOPA_RVT_AGGREGATE:
            get_aggregate(global_alloc.init);
            generate_aggregate();
            break;
        default:
            assert(false);
    }
    var_info_t vinfo;
    vinfo.type=VAR_TYPE::ON_GLOBAL;
    vinfo.global_name=gname;
    std::cout<<std::endl;
    return vinfo;
}

var_info_t Visit(const koopa_raw_get_elem_ptr_t &get_elem_ptr)
{
    dbg_rscv_printf("Visit get elem ptr\n");
    std::cout<<std::endl<<"  # get elem ptr"<<std::endl;

    var_info_t src_var;
    if(get_elem_ptr.src->kind.tag==KOOPA_RVT_GLOBAL_ALLOC)
    {
        src_var=is_visited[get_elem_ptr.src];
        int new_reg_id=reg_manager.alloc_reg();
        std::cout<<"  la "<<gen_reg(new_reg_id)<<", "<<src_var.global_name<<std::endl;
        src_var.reg_id=new_reg_id;
    }
    else if(get_elem_ptr.src->kind.tag==KOOPA_RVT_ALLOC)
    {
        src_var=is_visited[get_elem_ptr.src];
        int new_reg_id = reg_manager.alloc_reg();
        GenAddInst("sp",gen_reg(new_reg_id),src_var.stack_location);
        src_var.reg_id=new_reg_id;
    }
    else
        src_var=Visit(get_elem_ptr.src);
    
    var_info_t index_var=Visit(get_elem_ptr.index);
    var_info_t res_var;

    koopa_raw_type_t array=get_elem_ptr.src->ty->data.pointer.base;
    int total_size=get_var_size(array);
    int elem_size=total_size/(array->data.array.len);

    int new_reg_id=reg_manager.alloc_reg();
    std::string new_reg_name=gen_reg(new_reg_id);
    std::cout<<"  li "<<new_reg_name<<", "<<elem_size<<std::endl;
    std::cout<<"  mul "<<new_reg_name<<", "<<new_reg_name<<", "<<gen_reg(index_var.reg_id)<<std::endl;

    std::cout<<"  add "<<gen_reg(src_var.reg_id)<<", "<<gen_reg(src_var.reg_id)<<", "<<new_reg_name<<std::endl;


    
    res_var.type=VAR_TYPE::ON_STACK;
    res_var.stack_location=stack_frame.push();
    GenLoadStoreInst("sw", gen_reg(src_var.reg_id), res_var.stack_location, "sp");
    return res_var;
}
var_info_t Visit(const koopa_raw_get_ptr_t &get_ptr)
{
    dbg_rscv_printf("Visit get ptr\n");
    std::cout << std::endl<< "  # get ptr" << std::endl;

    var_info_t src_var = Visit(get_ptr.src);
    
    var_info_t index_var = Visit(get_ptr.index);
    var_info_t res_var;

    koopa_raw_type_t array = get_ptr.src->ty->data.pointer.base;
    int elem_size = get_var_size(array);

    int new_reg_id = reg_manager.alloc_reg();
    std::string new_reg_name = gen_reg(new_reg_id);
    std::cout << "  li " << new_reg_name << ", " << elem_size << std::endl;
    std::cout << "  mul " << new_reg_name << ", " << new_reg_name << ", " << gen_reg(index_var.reg_id) << std::endl;

    std::cout << "  add " << gen_reg(src_var.reg_id) << ", " << gen_reg(src_var.reg_id) << ", " <<new_reg_name << std::endl;

    res_var.type = VAR_TYPE::ON_STACK;
    res_var.stack_location = stack_frame.push();
    GenLoadStoreInst("sw", gen_reg(src_var.reg_id), res_var.stack_location, "sp");
    return res_var;
}

int get_var_size(const koopa_raw_type_t &ty)
{
    if(ty->tag==KOOPA_RTT_ARRAY)
        return (ty->data.array.len)*get_var_size(ty->data.array.base);
    else
        return 4;
}

void get_aggregate(const koopa_raw_value_t &aggr)
{
    koopa_raw_slice_t elems=aggr->kind.data.aggregate.elems;
    for(size_t i=0;i<elems.len;++i)
    {
        auto elem = reinterpret_cast<koopa_raw_value_t>(elems.buffer[i]);
        if(elem->kind.tag==KOOPA_RVT_INTEGER)
            aggregate_vals.push_back(elem->kind.data.integer.value);
        else if(elem->kind.tag==KOOPA_RVT_AGGREGATE)
            get_aggregate(elem);
        else
            assert(false);
    }
}
void generate_aggregate()
{
    int zero_cnt=0;
    for(auto& val: aggregate_vals)
    {
        if(val!=0)
        {
            if(zero_cnt!=0)
                std::cout<<"  .zero "<<zero_cnt*4<<std::endl;
            std::cout<<"  .word "<<val<<std::endl;
            zero_cnt=0;
        }
        else
            zero_cnt++;
    }
    if (zero_cnt != 0)
        std::cout << "  .zero " << zero_cnt * 4 << std::endl;
    aggregate_vals.clear();
}