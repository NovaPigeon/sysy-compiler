#pragma once

#include <unordered_map>
#include <string>

enum SYMBOL_TYPE
{
    CONST_SYMBOL,
    VAR_SYMBOL
};
typedef struct
{
    SYMBOL_TYPE type;
    int val;
    int addr;
    std::string ir_name;
} symbol_info_t;

class SymbolTable
{
public:
    SymbolTable(){stack_cnt=0;}
    int Insert(std::string symbol,int val);
    int Insert(std::string symbol, std::string ir_name);
    bool Exist(std::string symbol);
    symbol_info_t *LookUp(std::string symbol);
private:
    int stack_cnt;
    std::unordered_map<std::string,symbol_info_t*> symbol_table;

};

extern SymbolTable symbol_table;