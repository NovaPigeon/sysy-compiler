#include "symbol_table.h"
#include <iostream>
//#define DEBUG_SYMTAB
#ifdef DEBUG_SYMTAB
#define dbg_sym_printf(...) fprintf(stderr, __VA_ARGS__)
#else
#define dbg_sym_printf(...)
#endif

SymbolTableStack symbol_table_stack;
std::unordered_map<std::string, std::string> func_map;

std::string SymbolTable::Insert(std::string symbol,int val)
{
    if(Exist(symbol))
        return "";
    symbol_info_t* info=new symbol_info_t;
    info->val=val;
    info->type=SYMBOL_TYPE::CONST_SYMBOL;
    dbg_sym_printf("insert const %s %d\n",symbol.c_str(),val);
    this->symbol_table[symbol]=info;
    return "";
}
std::string SymbolTable::Insert(std::string symbol, std::string ir_name,SYMBOL_TYPE type,int ndim)
{
    if (Exist(symbol))
        return "";
    symbol_info_t *info = new symbol_info_t;
    info->ir_name=ir_name+name;
    info->type = type;
    info->ndim=ndim;
    dbg_sym_printf("insert var %s %s %d\n", symbol.c_str(), info->ir_name.c_str(),info->type);
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
    dbg_sym_printf("push scope.\n");
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
    dbg_sym_printf("pop scope.\n");
    SymbolTable *sym_tab=this->parent;
    return sym_tab;
}

void initSysyRuntimeLib()
{
    func_map["getint"]="i32";
    func_map["getch"]="i32";
    func_map["getarray"]="i32";
    func_map["putint"]="void";
    func_map["putch"]="void";
    func_map["putarray"]="void";
    func_map["starttime"]="void";
    func_map["stoptime"]="void";
    std::cout<<"decl @getint(): i32"<<std::endl;
    std::cout<<"decl @getch(): i32"<<std::endl;
    std::cout<<"decl @getarray(*i32): i32"<<std::endl;
    std::cout<<"decl @putint(i32)"<<std::endl;
    std::cout<<"decl @putch(i32)"<<std::endl;
    std::cout<<"decl @putarray(i32, *i32)"<<std::endl;
    std::cout<<"decl @starttime()"<<std::endl;
    std::cout<<"decl @stoptime()"<<std::endl;

}