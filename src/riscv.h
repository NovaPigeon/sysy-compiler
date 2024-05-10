#pragma once

#include <string>
#include <unordered_map>
#include "koopa.h"

#define REG_NUM 15
#define MAX_IMMEDIATE_VAL 2048
#define ZERO_REG_ID 15

#define RISCV_DEBUG
#ifdef RISCV_DEBUG
#define dbg_rscv_printf(...) fprintf(stderr, __VA_ARGS__)
#else
#define dbg_rscv_printf(...)
#endif

class StackFrame
{
public:
    StackFrame(){top=0;}
    void set_stack_size(int size)
    {
        assert(size%16==0);
        assert(size>=0);
        stack_size=size;
        top=0;
    }
    int push()
    {
        top+=4;
        assert(top<=stack_size);
        return top-4;
    }
    int get_stack_size() const
    {
        return stack_size;
    }
private:
    int stack_size;
    int top;
};

class RegManager
{
private:
    std::unordered_map<int,bool> regs_occupied;
public:
    RegManager()
    {
        for (int i = 0; i < REG_NUM; ++i)
            regs_occupied[i] = false;
    }
    void free_regs()
    {
        for(int i=0;i<REG_NUM;++i)
            regs_occupied[i]=false;
    }
    int alloc_reg()
    {
        int ret=-1;
        for(int i=0;i<REG_NUM;++i)
        {
            if(regs_occupied[i]==false)
            {
                ret=i;
                regs_occupied[i]=true;
                break;
            }
        }
        assert(ret!=-1);
        return ret;
    }


};
enum VAR_TYPE
{
    ON_STACK,
    ON_REG
};
typedef struct
{
    VAR_TYPE type;
    int stack_location;
    int reg_id;

} var_info_t;

// 函数声明
void Visit(const koopa_raw_program_t &program);
void Visit(const koopa_raw_slice_t &slice);
void Visit(const koopa_raw_function_t &func);
void Visit(const koopa_raw_basic_block_t &bb);
void Visit(const koopa_raw_return_t &ret);
void Visit(const koopa_raw_store_t &store);
void Visit(const koopa_raw_branch_t &branch);
void Visit(const koopa_raw_jump_t &jump);
void Prologue(const koopa_raw_function_t &func);
void Epilogue();
var_info_t Visit(const koopa_raw_value_t &value);
var_info_t Visit(const koopa_raw_integer_t &interger);
var_info_t Visit(const koopa_raw_binary_t &binary);
var_info_t Visit(const koopa_raw_load_t &load);

