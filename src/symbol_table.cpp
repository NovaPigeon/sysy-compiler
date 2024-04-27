#include "symbol_table.h"

SymbolTable symbol_table;

int SymbolTable::Insert(std::string symbol,int val)
{
    if(Exist(symbol))
        return -1;
    symbol_info_t* info=(symbol_info_t*)malloc(sizeof(symbol_info_t));
    info->val=val;
    printf("insert %s %d\n",symbol.c_str(),val);
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