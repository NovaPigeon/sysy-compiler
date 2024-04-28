#include "symbol_table.h"

SymbolTableStack symbol_table_stack;

std::string SymbolTable::Insert(std::string symbol,int val)
{
    if(Exist(symbol))
        return "";
    symbol_info_t* info=new symbol_info_t;
    info->val=val;
    info->type=SYMBOL_TYPE::CONST_SYMBOL;
    printf("insert const %s %d\n",symbol.c_str(),val);
    this->symbol_table[symbol]=info;
    return "";
}
std::string SymbolTable::Insert(std::string symbol, std::string ir_name)
{
    if (Exist(symbol))
        return "";
    symbol_info_t *info = new symbol_info_t;
    info->type=SYMBOL_TYPE::VAR_SYMBOL;
    info->ir_name=ir_name+name;
    printf("insert var %s %s\n", symbol.c_str(), info->ir_name.c_str());
    this->symbol_table[symbol] = info;
    return info->ir_name;
}
bool SymbolTable::Exist(std::string symbol)
{
    return (symbol_table.find(symbol)!=symbol_table.end());
}

symbol_info_t *SymbolTable::LookUp(std::string symbol)
{
    if(Exist(symbol))
        return symbol_table[symbol];
    if(parent!=nullptr)
        return parent->LookUp(symbol);
    else
        return nullptr;
}
SymbolTable *SymbolTable::PushScope()
{
    printf("push scope.\n");
    SymbolTable *sym_tab=new SymbolTable(stack_depth+1,child_cnt);
    child_cnt++;
    sym_tab->name=name+"_"+std::to_string(sym_tab->id);
    sym_tab->parent=this;
    sym_tab->child=nullptr;
    this->child=sym_tab;
    return sym_tab;
}
SymbolTable *SymbolTable::PopScope()
{
    printf("pop scope.\n");
    SymbolTable *sym_tab=this->parent;
    return sym_tab;
}