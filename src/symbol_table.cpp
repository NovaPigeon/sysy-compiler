#include "symbol_table.h"

SymbolTable symbol_table;

int SymbolTable::Insert(std::string symbol,int val)
{
    if(Exist(symbol))
        return -1;
    symbol_info_t* info=new symbol_info_t;
    info->val=val;
    this->symbol_table[symbol]=info;
    return 0;
}

bool SymbolTable::Exist(std::string symbol)
{
    return (symbol_table.find(symbol)!=symbol_table.end());
}

symbol_info_t *SymbolTable::LookUp(std::string symbol)
{
    if(Exist(symbol))
        return symbol_table[symbol];
    return nullptr;
}