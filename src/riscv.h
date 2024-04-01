#pragma once
#include <cassert>
#include <cstdio>
#include <iostream>
#include <memory>
#include <string>
#include <string.h>
#include "koopa.h"
// 函数声明
std::string Visit(const koopa_raw_program_t &program);
std::string Visit(const koopa_raw_slice_t &slice);
std::string Visit(const koopa_raw_function_t &func);
std::string Visit(const koopa_raw_basic_block_t &bb);
std::string Visit(const koopa_raw_value_t &value);
std::string Visit(const koopa_raw_return_t &ret);
std::string Visit(const koopa_raw_integer_t &interger);

// 访问 raw program
std::string Visit(const koopa_raw_program_t &program)
{
    std::string rscv="  .text\n";
    // 访问所有全局变量
    rscv+=Visit(program.values);
    // 访问所有函数
    rscv+=Visit(program.funcs);
    return rscv;
}

// 访问 raw slice
std::string Visit(const koopa_raw_slice_t &slice)
{
    std::string rscv="";
    for (size_t i = 0; i < slice.len; ++i)
    {
        auto ptr = slice.buffer[i];
        // 根据 slice 的 kind 决定将 ptr 视作何种元素
        switch (slice.kind)
        {
        case KOOPA_RSIK_FUNCTION:
            // 访问函数
            rscv+=Visit(reinterpret_cast<koopa_raw_function_t>(ptr));
            break;
        case KOOPA_RSIK_BASIC_BLOCK:
            // 访问基本块
            rscv += Visit(reinterpret_cast<koopa_raw_basic_block_t>(ptr));
            break;
        case KOOPA_RSIK_VALUE:
            // 访问指令
            rscv += Visit(reinterpret_cast<koopa_raw_value_t>(ptr));
            break;
        default:
            // 我们暂时不会遇到其他内容, 于是不对其做任何处理
            assert(false);
        }
    }
    return rscv;
}

// 访问函数
std::string Visit(const koopa_raw_function_t &func)
{
    std::string func_name=std::string(func->name+1);
    std::string rscv = "  .globl "+func_name+"\n";
    rscv+=func_name+":\n";
    // 访问所有基本块
    rscv+=Visit(func->bbs);
    return rscv;
}

// 访问基本块
std::string Visit(const koopa_raw_basic_block_t &bb)
{
    // 访问所有指令
    return Visit(bb->insts);
}

// 访问指令
std::string Visit(const koopa_raw_value_t &value)
{
    std::string rscv="";
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
    default:
        // 其他类型暂时遇不到
        assert(false);
    }
    return rscv;
}

// 访问对应类型指令的函数定义略
// 视需求自行实现
// ...
// 访问基本块
std::string Visit(const koopa_raw_return_t &ret)
{
    koopa_raw_value_t val=ret.value;
    std::string rscv=Visit(val);
    rscv+="  ret\n";
    return rscv;

}

std::string Visit(const koopa_raw_integer_t &interger)
{
    int32_t val=interger.value;
    std::string rscv="  li a0, "+std::to_string(val)+"\n";
    return rscv;
}
