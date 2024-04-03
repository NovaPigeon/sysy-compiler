#pragma once

#include <string>
#include "koopa.h"

#define REG_NUM 15
//#define RISCV_DEBUG

#ifdef RISCV_DEBUG
#define dbg_printf(...) fprintf(stderr, __VA_ARGS__)
#else
#define dbg_printf(...)
#endif
// 函数声明
std::string Visit(const koopa_raw_program_t &program);
std::string Visit(const koopa_raw_slice_t &slice);
std::string Visit(const koopa_raw_function_t &func);
std::string Visit(const koopa_raw_basic_block_t &bb);
std::string Visit(const koopa_raw_value_t &value);
std::string Visit(const koopa_raw_return_t &ret);
std::string Visit(const koopa_raw_integer_t &interger);
std::string Visit(const koopa_raw_binary_t &binary);

