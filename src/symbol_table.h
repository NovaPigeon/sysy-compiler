#pragma once

#include <unordered_map>
#include <string>
typedef struct
{
    int val;
    int addr;
} symbol_info_t;

class SymbolTable
{
public:
    SymbolTable(){stack_cnt=0;}
    int Insert(std::string symbol,int val);
    bool Exist(std::string symbol);
    symbol_info_t *LookUp(std::string symbol);
private:
    int stack_cnt;
    std::unordered_map<std::string,symbol_info_t*> symbol_table;

};

extern SymbolTable symbol_table;