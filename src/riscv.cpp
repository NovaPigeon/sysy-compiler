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



static const std::string regs[REG_NUM]=
{
    "t0","t1","t2","t3","t4","t5","t6",
    "a0","a1","a2","a3","a4","a5","a6","a7"
};
static std::string gen_reg(int id)
{
    if (id < REG_NUM)
        return regs[id];
    return "a"+std::to_string(id);
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

static std::map<koopa_raw_value_t,std::string> is_visited;

int interger_reg_cnt=0; // 临时的 reg，用于计算 binary，当调用新的 binary 是会被刷新。
int reg_cnt=0; // 永久分配，binary 计算的结果。

static std::string get_reg(std::string str);
static std::string get_insts(std::string str);

// 访问 raw program
std::string Visit(const koopa_raw_program_t &program)
{
    std::string rscv = "  .text\n";
    // 访问所有全局变量
    rscv += Visit(program.values);
    // 访问所有函数
    rscv += Visit(program.funcs);
    return rscv;
}

// 访问 raw slice
std::string Visit(const koopa_raw_slice_t &slice)
{
    std::string rscv = "";
    for (size_t i = 0; i < slice.len; ++i)
    {
        auto ptr = slice.buffer[i];
        // 根据 slice 的 kind 决定将 ptr 视作何种元素
        switch (slice.kind)
        {
        case KOOPA_RSIK_FUNCTION:
            // 访问函数
            rscv +=get_insts(  Visit(reinterpret_cast<koopa_raw_function_t>(ptr)));
            break;
        case KOOPA_RSIK_BASIC_BLOCK:
            // 访问基本块
            rscv += get_insts( Visit(reinterpret_cast<koopa_raw_basic_block_t>(ptr)));
            break;
        case KOOPA_RSIK_VALUE:
            // 访问指令
            rscv += get_insts( Visit(reinterpret_cast<koopa_raw_value_t>(ptr)));
            break;
        default:
            // 我们暂时不会遇到其他内容, 于是不对其做任何处理
            assert(false);
        }
    }
    dbg_printf("Visit slice:\n%s\n", rscv.c_str());
    return rscv;
}

// 访问函数
std::string Visit(const koopa_raw_function_t &func)
{
    std::string func_name = std::string(func->name + 1);
    std::string rscv = "  .globl " + func_name + "\n";
    rscv += func_name + ":\n";
    // 访问所有基本块
    rscv += Visit(func->bbs);
    dbg_printf("Visit func:\n%s\n", rscv.c_str());
    return rscv;
}

// 访问基本块
std::string Visit(const koopa_raw_basic_block_t &bb)
{
    // 访问所有指令
    std::string rscv = Visit(bb->insts);
    dbg_printf("Visit bb:\n%s\n",rscv.c_str());
    return rscv;
}

// 访问指令
std::string Visit(const koopa_raw_value_t &value)
{
    if(is_visited.find(value)!=is_visited.end())
        return is_visited[value];
    std::string rscv = "";
    // 根据指令类型判断后续需要如何访问
    const auto &kind = value->kind;
    switch (kind.tag)
    {
    case KOOPA_RVT_RETURN:
        // 访问 return 指令
        rscv += Visit(kind.data.ret);
        break;
    case KOOPA_RVT_INTEGER:
        // 访问 integer 指令
        rscv += Visit(kind.data.integer);
        break;
    case KOOPA_RVT_BINARY:
        // 访问 binary 指令
        rscv += Visit(kind.data.binary);
        break;
    default:
        // 其他类型暂时遇不到
        assert(false);
    }
    is_visited[value]=get_reg(rscv);
    dbg_printf("Visit value: %d\n%s\n", kind.tag,rscv.c_str());
    return rscv;
}

// 访问对应类型指令的函数定义略
// 视需求自行实现
// ...
// 访问 return
std::string Visit(const koopa_raw_return_t &ret)
{
    koopa_raw_value_t val = ret.value;
    std::string tmp=Visit(val);
    std::string reg = get_reg(tmp);
    std::string insts=get_insts(tmp);
    std::string rscv="a0\n"+insts+"  mv a0, "+reg+"\n";
    rscv += "  ret\n";
    dbg_printf("Visit return:\n%s\n", rscv.c_str());
    return rscv;
}

// 访问 interger 指令
std::string Visit(const koopa_raw_integer_t &interger)
{
    int32_t val = interger.value;
    if(val==0)
        return "x0\n";
    std::string reg = gen_reg( interger_reg_cnt);
    interger_reg_cnt++;
    std::string rscv = reg+"\n"
    "  li "+reg+", " + std::to_string(val) + "\n";
    dbg_printf("Visit integer:\n%s\n", rscv.c_str());
    return rscv;
}

std::string Visit(const koopa_raw_binary_t &binary)
{
    
    interger_reg_cnt=reg_cnt;
    
    std::string l=Visit(binary.lhs);
    std::string l_reg=get_reg(l);
    std::string l_insts=get_insts(l);
    std::string r=Visit(binary.rhs);
    std::string r_reg=get_reg(r);
    std::string r_insts=get_insts(r);
    
    interger_reg_cnt=reg_cnt;
    std::string new_reg=gen_reg (reg_cnt);
    reg_cnt++;

    std::string rscv=new_reg+"\n"+l_insts+r_insts;
    

    koopa_raw_binary_op_t op = binary.op;
    std::string op_insts="";
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
        op_insts = op_names[op];
        rscv += "  " + op_insts + " " + new_reg + ", " + l_reg + ", " + r_reg + "\n";
        break;
    case KOOPA_RBO_EQ:
        rscv += "  xor " + new_reg + ", " + l_reg + ", " + r_reg + "\n" + "  seqz " + new_reg + ", " + new_reg + "\n";
        break;
    case KOOPA_RBO_NOT_EQ:
        rscv += "  xor " + new_reg + ", " + l_reg + ", " + r_reg + "\n" + "  snez " + new_reg + ", " + new_reg + "\n";
        break;
    case KOOPA_RBO_LE:  
        rscv+="  sgt "+new_reg+", "+l_reg+", "+r_reg+"\n"+"  xori "+new_reg+", "+new_reg+", 1\n";
        break;
    case KOOPA_RBO_GE:
        rscv += "  slt " + new_reg + ", " + l_reg + ", " + r_reg + "\n" + "  xori " + new_reg + ", " + new_reg + ", 1\n";
    }
    dbg_printf("Visit value: %d\n%s\n", op, rscv.c_str());
    return rscv;
}

std::string get_reg(std::string str)
{
    std::istringstream iss(str);
    std::string var;
    std::getline(iss, var);
    return var;
}

std::string get_insts(std::string str)
{
    std::istringstream iss(str);
    std::string var;
    std::getline(iss, var);

    std::string rscv;
    if(var[0]==' ')
        rscv=var+"\n";
    std::string line;
    while (std::getline(iss, line))
    {
        rscv += line + "\n";
    }

    return rscv;
}