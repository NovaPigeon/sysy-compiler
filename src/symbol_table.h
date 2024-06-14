#pragma once

#include <unordered_map>
#include <string>

enum SYMBOL_TYPE
{
    CONST_SYMBOL,
    VAR_SYMBOL,
    ARR_SYMBOL,
    PTR_SYMBOL
};
typedef struct
{
    SYMBOL_TYPE type;
    int val;
    int ndim;
    std::string ir_name;
    
} symbol_info_t;


class SymbolTable;
class SymbolTableStack;
class SymbolTable
{
public:
    SymbolTable()
    {
        stack_depth=0;
        id=0;
        child_cnt=0;
        name="";
        parent=nullptr;
        child=nullptr;
    }
    SymbolTable(int depth,int id):stack_depth(depth),id(id),child_cnt(0){}
    std::string Insert(std::string symbol,int val);
    std::string Insert(std::string symbol, std::string ir_name,SYMBOL_TYPE type,int ndim);
    bool Exist(std::string symbol);
    symbol_info_t *LookUp(std::string symbol);
    SymbolTable *PopScope();
    SymbolTable *PushScope();
    ~SymbolTable()
    {
        for(auto &item: symbol_table)
            delete item.second;
        symbol_table.clear();
            
    }
private:
    int stack_depth;
    int id;
    int child_cnt;
    std::string name;
    SymbolTable *parent;
    SymbolTable *child;

    std::unordered_map<std::string,symbol_info_t*> symbol_table;

};
class SymbolTableStack
{
private:
    SymbolTable *current_symtab;
public:
    SymbolTableStack(){current_symtab=new SymbolTable();}
    void PopScope()
    {
        SymbolTable *old=current_symtab;
        current_symtab=current_symtab->PopScope();
        delete old;

    }
    void PushScope()
    {
        current_symtab=current_symtab->PushScope();
    }
    std::string Insert(std::string symbol, int val)
    {
        return current_symtab->Insert(symbol,val);
    }
    std::string Insert(std::string symbol, std::string ir_name,SYMBOL_TYPE type,int ndim=-1)
    {
        return current_symtab->Insert(symbol,ir_name,type,ndim);
    }
    bool Exist(std::string symbol)
    {
        return current_symtab->Exist(symbol);
    }
    symbol_info_t *LookUp(std::string symbol)
    {
        return current_symtab->LookUp(symbol);
    }
};

void initSysyRuntimeLib();

extern std::unordered_map<std::string,std::string> func_map;
extern SymbolTableStack symbol_table_stack;

