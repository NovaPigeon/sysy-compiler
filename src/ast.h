#pragma once

#include <cassert>
#include <memory>
#include <string>
#include <iostream>
#include <sstream>
#include <map>
#include <vector>
#include <stack>
#include <algorithm>
#include "symbol_table.h"

//#define DEBUG_AST
#ifdef DEBUG_AST
#define dbg_ast_printf(...) fprintf(stderr, __VA_ARGS__)
#else
#define dbg_ast_printf(...)
#endif

class BaseAST;
class VecAST;
class ExpVecAST;
class BaseExpAST;

class CompUnitAST;
class FuncDefAST;
class BlockAST;
class StmtAST;

class ExpAST;
class PrimaryExpAST;
class UnaryExpAST;
class MulExpAST;
class AddExpAST;
class RelExpAST;
class EqExpAST;
class LAndExpAST;
class LOrExpAST;

class DeclAST;
class ConstDeclAST;
class TypeAST;
class ConstDefAST;
class ConstInitValAST;
class BlockItemAST;
class LValAST;
class ConstExpAST;
class VarDeclAST;
class VarDefAST;
class InitVal;

class OpenStmtAST;
class ClosedStmtAST;
class SimpleStmtAST;

class FuncFParamAST;

class NDimArray;


// enums
enum PrimaryExpType
{
    EXP,
    NUMBER,
    LVAL
};
enum UnaryExpType
{
    PRIMARY,
    UNARY,
    CALL
};
enum BianryOPExpType
{
    INHERIT,
    EXPAND
};
enum DeclType
{
    CONST_DECL,
    VAR_DECL
};
enum VarDefType
{
    VAR,
    VAR_ARRAY,
    VAR_ASSIGN_VAR,
    VAR_ASSIGN_ARRAY
};

enum BlockItemType
{
    BLK_DECL,
    BLK_STMT
};

enum SimpleStmtType
{
    SSTMT_ASSIGN,
    SSTMT_EMPTY_RET,
    SSTMT_RETURN,
    SSTMT_EMPTY_EXP,
    SSTMT_EXP,
    SSTMT_BLK,
    SSTMT_BREAK,
    SSTMT_CONTINUE
};

enum StmtType
{
    STMT_OPEN,
    STMT_CLOSED
};

enum OpenStmtType
{
    OSTMT_CLOSED,
    OSTMT_OPEN,
    OSTMT_ELSE,
    OSTMT_WHILE
};

enum ClosedStmtType
{
    CSTMT_SIMPLE,
    CSTMT_ELSE,
    CSTMT_WHILE
};

enum InitType
{
    INIT_VAR,
    INIT_ARRAY
};

enum LValType
{
    LVAL_VAR,
    LVAL_ARRAY
};

enum FuncFParamType
{
    FUNCF_VAR,
    FUNCF_ARR
};
static std::map<std::string, std::string> op_names = {
    {"!=", "ne"},
    {"==", "eq"},
    {">", "gt"},
    {"<", "lt"},
    {">=", "ge"},
    {"<=", "le"},
    {"+", "add"},
    {"-", "sub"},
    {"*", "mul"},
    {"/", "div"},
    {"%", "mod"},
    {"&&", "and"},
    {"||", "or"}};

static int symbol_cnt = 0;
static int label_cnt=0;
static bool is_ret=false;
static int alloc_tmp=0;
static std::vector<int> while_stack;
static std::string current_func;

static void print_dims(const std::vector<int> &dims, int ndim)
{
    for (int i = 0; i < ndim; ++i)
    {
        std::cout << "[";
    }
    std::cout << "i32";
    for (int i = ndim-1; i >= 0; i--)
    {
        std::cout << ", " << dims[i] << "]";
    }
}

static std::string get_arr_type(const std::vector<int> &dims,int ndim)
{
    std::string res="";
    for (int i = 0; i < ndim; ++i)
    {
        res+="[";
    }
    res+= "i32";
    for (int i = ndim - 1; i >= 0; i--)
    {
        res+=", "+std::to_string(dims[i])+"]";
    }
    return res;
}


class NDimArray
{
private:
    std::vector<int> dims;
    std::vector<int> dims_size;
    std::vector<int> sub_dims_size;
    int ndim;
    std::vector<std::string> vals;
    int val_cnt;
public:
    NDimArray(std::vector<int> dims_,int ndim_)
    {
        dims=dims_;
        ndim=ndim_;
        for(int i=0;i<ndim;++i)
        {
            int size=1;
            int sub_size=1;
            for(int j=i;j<ndim;++j)
            {
                size*=dims[j];
            }
            for (int j = i+1; j < ndim; ++j)
            {
                sub_size *= dims[j];
            }
            dims_size.push_back(size);
            sub_dims_size.push_back(sub_size);
        }
        val_cnt=0;
    }
    void push(int val)
    {
        vals.push_back(std::to_string(val));
        val_cnt++;
    }
    void push(std::string val)
    {
        vals.push_back(val);
        val_cnt++;
    }
    int get_currcnt() const
    {
        return val_cnt;
    }
    int get_align(int depth)
    {
        for(int i=depth;i<ndim;++i)
        {
            if(val_cnt%dims_size[i]==0)
                return dims_size[i];
        }
        assert(false);
    }
    void generate_aggregate()
    {
        for(int i=val_cnt;i<dims_size[0];++i)
            vals.push_back("0");

        for(int i=0;i<ndim;++i)
            std::cout<<"{";
        
        val_cnt=dims_size[0];
        if(val_cnt==1)
        {
            std::cout<<vals[0]<<"}";
            return;
        }
        
        for(int i=1;i<=val_cnt;++i)
        {
            if(i%dims[ndim-1]==1)
            {
                std::cout<<vals[i-1];
            }
            else if(i%dims[ndim-1]==0)
            {
                std::cout<<", "<<vals[i-1];
                int align=0;
                for(int j=0;j<ndim;++j)
                {
                    if(i%dims_size[j]==0)
                    {
                        align=j;
                        break;
                    }
                }
                for(int j=0;j<ndim-align;++j)
                    std::cout<<"}";
                
                if(i==val_cnt)
                    return;
                std::cout<<", ";
                for (int j = 0; j < ndim - align; ++j)
                    std::cout << "{";
            }
            else
                std::cout<<", "<<vals[i-1];
        }
        

    }
    void generate_assign(std::string ir_name)
    {
        for (int i = val_cnt; i < dims_size[0]; ++i)
            vals.push_back("0");
        val_cnt=dims_size[0];
        std::string last_symbol=ir_name;
        for(int i=0;i<ndim-1;++i)
        {
            std::string new_symbol="%"+std::to_string(symbol_cnt);
            std::cout<<"  "<<new_symbol<<" = getelemptr "<<last_symbol<<", 0"<<std::endl;
            last_symbol=new_symbol;
            symbol_cnt++;
        }
        for(int i=0;i<val_cnt;++i)
        {
            std::string new_symbol = "%" + std::to_string(symbol_cnt);
            symbol_cnt++;
            std::cout<<"  "<<new_symbol<<" = getelemptr "<<last_symbol<<", "<<i<<std::endl;
            std::cout << "  store " << vals[i] << ", " << new_symbol << std::endl;
        }
    }

};

static NDimArray *ndarr=nullptr;
static int dim_depth=0;

class VecAST
{
public:
    std::vector<std::unique_ptr<BaseAST>> vec;
    void push_back(std::unique_ptr<BaseAST> &ast)
    {
        vec.push_back(std::move(ast));
    }

};

class ExpVecAST
{
public:
    std::vector<std::unique_ptr<BaseExpAST>> vec;
    void push_back(std::unique_ptr<BaseExpAST> &ast)
    {
        vec.push_back(std::move(ast));
    }
};

// 所有 AST 的基类
class BaseAST
{
public:
    std::string ident = "";
    std::string var_type="";
    int ndim=-1;
    bool is_global=false;
    virtual ~BaseAST() = default;
    virtual void GenerateIR() = 0;
};

// 所有 Exp 的基类
class BaseExpAST: public BaseAST
{
public:
    virtual void Eval() =0;
    
    bool is_const=false;
    bool is_evaled=false;
    bool is_left=false;
    int val=-1;
    std::vector<int> vals;
    void Copy(std::unique_ptr<BaseExpAST>& exp)
    {
        is_const=exp->is_const;
        is_evaled=exp->is_evaled;
        val=exp->val;
        ident=exp->ident;


    }
};

// CompUnit 是 BaseAST
// CompUnit ::= [CompUnit] FuncDef | Decl;
class CompUnitAST : public BaseAST
{
public:
    // 用智能指针管理对象
    std::unique_ptr<VecAST> comp_units;
    void GenerateIR()  override
    {
        dbg_ast_printf("CompUnit ::= [CompUnit] FuncDef;\n");
        //symbol_table_stack.PushScope();
        initSysyRuntimeLib();
        for(auto &item:comp_units->vec)
        {
            item->is_global=true;
            item->GenerateIR();
        }
        //symbol_table_stack.PopScope();
    }
};

// FuncDef 也是 BaseAST
// FuncDef ::= FuncType IDENT "(" [FuncFParams] ")" Block;
class FuncDefAST : public BaseAST
{
public:
    std::unique_ptr<BaseAST> func_type;
    std::unique_ptr<BaseAST> block;
    std::unique_ptr<VecAST> func_fparams;
    void GenerateIR()  override
    {
        current_func=ident;
        func_type->GenerateIR();
        dbg_ast_printf("FuncDef ::= %s %s '(' [FuncFParams] ')' Block;\n", 
        ident.c_str(), 
        func_type->ident.c_str());
        
        symbol_cnt=0;
        assert(func_map.find(ident)==func_map.end());
        func_map[ident]=func_type->ident;
        symbol_table_stack.PushScope();
        std::vector<std::string> params;
        std::vector<std::string> types;
        std::vector<int> ndims;
        std::cout<<"fun @"<<ident<<"(";

        int cnt=0;
        for(auto &param: func_fparams->vec)
        {
            if(cnt!=0)
                std::cout<<", ";
            param->GenerateIR();
            params.push_back(param->ident);
            types.push_back(param->var_type);
            ndims.push_back(param->ndim);
            cnt++;
        }

        std::cout<<")";
        if(func_type->ident=="i32")
            std::cout<<": "<<func_type->ident;
        std::cout << " {" << std::endl;
        std::cout << "%_entry_"<<ident<<":" << std::endl;

        for(int i=0;i<params.size();++i)
        {
            std::string t=types[i];
            SYMBOL_TYPE st;
            if(t=="i32")
                st=SYMBOL_TYPE::VAR_SYMBOL;
            else
                st=SYMBOL_TYPE::PTR_SYMBOL;
            
            symbol_table_stack.Insert(params[i], "%" + params[i],st,ndims[i]+1);
            symbol_info_t* info=symbol_table_stack.LookUp(params[i]);
            symbol_info_t* ninfo=symbol_table_stack.LookUp("arg_"+params[i]);
            std::cout<<"  "<<info->ir_name<<" = alloc "<<t<<std::endl;
            std::cout<<"  store "<<ninfo->ir_name<<", "<<info->ir_name<<std::endl;
        }
        block->GenerateIR();
        if(is_ret==false)
        {
            if (func_type->ident == "i32")
                std::cout << "  ret 0" << std::endl;
            else if(func_type->ident=="void")
                std::cout<<"  ret"<<std::endl;
        }
                
        
        std::cout << "}" << std::endl;
        symbol_table_stack.PopScope();
        is_ret=false;
    }
};

// Type ::= "int" | "void";
class TypeAST : public BaseAST
{
public:
    std::string type;
    void GenerateIR() override
    {   if(type=="int")
            ident= "i32";
        else if(type=="void")
            ident="void";
        else
            assert(false);
    }
};

// Block :: = "{" { BlockItem } "}";
class BlockAST : public BaseAST
{
public:
    std::unique_ptr<VecAST> block_items;
    void GenerateIR()  override
    {
        dbg_ast_printf("Block :: = '{' { BlockItem } '}'';\n");
        for(auto &item:block_items->vec)
        {  
            if(is_ret==true)
               break;
            item->GenerateIR();
        }
    }
};

// Stmt :: = OpenStmt | ClosedStmt;
class StmtAST: public BaseAST
{
public:
    StmtType bnf_type;
    std::unique_ptr<BaseAST> open_stmt;
    std::unique_ptr<BaseAST> closed_stmt;
    void GenerateIR() override
    {
        if(bnf_type==StmtType::STMT_CLOSED)
        {
            dbg_ast_printf("Stmt ::= OpenStmt;\n");
            closed_stmt->GenerateIR();
        }
        else if(bnf_type==StmtType::STMT_OPEN)
        {
            dbg_ast_printf("SimpleStmt ::= ClosedStmt;\n");
            open_stmt->GenerateIR();
        }
        else
            assert(false);
    }

};

// OpenStmt :: = IF '(' Exp ')' ClosedStmt | 
//               IF '(' Exp ')' OpenStmt | 
//               IF '(' Exp ')' ClosedStmt ELSE OpenStmt |
//               WHILE '(' Exp ')' OpenStmt

class OpenStmtAST: public BaseAST
{
public:
    OpenStmtType bnf_type;
    std::unique_ptr<BaseExpAST> exp;
    std::unique_ptr<BaseAST> open_stmt;
    std::unique_ptr<BaseAST> closed_stmt;
    void GenerateIR() override
    {
        std::string lable_then = "%_then_" + std::to_string(label_cnt),
                    lable_else = "%_else_" + std::to_string(label_cnt),
                    lable_end = "%_end_" + std::to_string(label_cnt),
                    lable_while_entry = "%_while_entry_" + std::to_string(label_cnt),
                    lable_while_body = "%_while_body_" + std::to_string(label_cnt);
        label_cnt++;
        
        if(bnf_type==OpenStmtType::OSTMT_CLOSED)
        {
            dbg_ast_printf("OpenStmt :: = IF '(' Exp ')' ClosedStmt;\n");
            exp->Eval();
            std::cout<<"  br "<<exp->ident<<", "<<lable_then<<", "<<lable_end<<std::endl<<std::endl;
            std::cout<<lable_then<<":"<<std::endl;
            is_ret=false;
            closed_stmt->GenerateIR();
            if(is_ret==false)
                std::cout<<"  jump "<<lable_end<<std::endl;
            std::cout << std::endl;

            std::cout<<lable_end<<":"<<std::endl;
            is_ret=false;
        }
        else if (bnf_type==OpenStmtType::OSTMT_OPEN)
        {
            dbg_ast_printf("OpenStmt :: = IF '(' Exp ')' OpenStmt;\n");
            exp->Eval();
            std::cout << "  br " << exp->ident << ", " << lable_then << ", " << lable_end << std::endl
                      << std::endl;
            std::cout << lable_then << ":" << std::endl;

            is_ret=false;
            open_stmt->GenerateIR();
            if(is_ret==false)
                std::cout << "  jump " << lable_end << std::endl;
            std::cout << std::endl;

            std::cout << lable_end << ":" << std::endl;
            is_ret=false;
        }
        else if(bnf_type==OpenStmtType::OSTMT_ELSE)
        {
            dbg_ast_printf("OpenStmt :: = IF '(' Exp ')' ClosedStmt ELSE OpenStmt;\n");
            bool total_ret=true;
            exp->Eval();
            std::cout << "  br " << exp->ident << ", " << lable_then << ", " << lable_else << std::endl
                      << std::endl;
            
            std::cout << lable_then << ":" << std::endl;
            is_ret=false;
            closed_stmt->GenerateIR();
            total_ret=total_ret&is_ret;
            if(is_ret==false)
                std::cout << "  jump " << lable_end << std::endl;
            std::cout << std::endl;

            std::cout<<lable_else<<":"<<std::endl;
            is_ret=false;
            open_stmt->GenerateIR();
            total_ret = total_ret & is_ret;
            if(is_ret==false)
                std::cout << "  jump " << lable_end << std::endl;
            std::cout << std::endl;

            if(total_ret==false)
                std::cout << lable_end << ":" << std::endl;
            is_ret=total_ret;
        }
        else if(bnf_type==OpenStmtType::OSTMT_WHILE)
        {
            dbg_ast_printf("OpenStmt :: = WHILE '(' Exp ')' OpenStmt;\n");
            while_stack.push_back(label_cnt-1);
            std::cout<<"  jump "<<lable_while_entry<<std::endl<<std::endl;

            std::cout<<lable_while_entry<<":"<<std::endl;
            exp->Eval();
            std::cout<<"  br "<<exp->ident<<", "<<lable_while_body<<", "<<lable_end<<std::endl<<std::endl;

            std::cout<<lable_while_body<<":"<<std::endl;
            is_ret=false;
            open_stmt->GenerateIR();
            if(is_ret==false)
                std::cout<<"  jump "<<lable_while_entry<<std::endl;
            std::cout<<std::endl;

            std::cout<<lable_end<<":"<<std::endl;
            is_ret = false;
            while_stack.pop_back();
        }
        else
            assert(false);
        
        
    }
};

// ClosedStmt : SimpleStmt | 
//              IF '(' Exp ')' ClosedStmt ELSE ClosedStmt

class ClosedStmtAST: public BaseAST
{
public:
    ClosedStmtType bnf_type;
    std::unique_ptr<BaseExpAST> exp;
    std::unique_ptr<BaseAST> closed_stmt1;
    std::unique_ptr<BaseAST> closed_stmt2;
    std::unique_ptr<BaseAST> simple_stmt;
    void GenerateIR() override
    {
        if(bnf_type==ClosedStmtType::CSTMT_SIMPLE)
        {
            dbg_ast_printf("ClosedStmt ::= SimpleStmt;\n");
            simple_stmt->GenerateIR();
        }
        else if(bnf_type==ClosedStmtType::CSTMT_ELSE)
        {
            dbg_ast_printf("ClosedStmt ::= IF '(' Exp ')' ClosedStmt ELSE ClosedStmt;\n");
            std::string lable_then = "%_then_" + std::to_string(label_cnt),
                        lable_else = "%_else_" + std::to_string(label_cnt),
                        lable_end = "%_end_" + std::to_string(label_cnt);
            label_cnt++;

            bool total_ret=true;
            exp->Eval();
            std::cout << "  br " << exp->ident << ", " << lable_then << ", " << lable_else << std::endl
                      << std::endl;

            std::cout << lable_then << ":" << std::endl;
            is_ret=false;
            closed_stmt1->GenerateIR();
            total_ret = total_ret & is_ret;
            if (is_ret == false)
                std::cout << "  jump " << lable_end << std::endl;
            std::cout << std::endl;

            std::cout << lable_else << ":" << std::endl;
            is_ret=false;
            closed_stmt2->GenerateIR();
            total_ret = total_ret & is_ret;
            if (is_ret == false)
                std::cout << "  jump " << lable_end << std::endl;
            std::cout << std::endl;

            if(total_ret==false)
                std::cout << lable_end << ":" << std::endl;
            is_ret=total_ret;
        }
        else if(bnf_type==ClosedStmtType::CSTMT_WHILE)
        {
            std::string lable_end = "%_end_" + std::to_string(label_cnt),
                        lable_while_entry = "%_while_entry_" + std::to_string(label_cnt),
                        lable_while_body = "%_while_body_" + std::to_string(label_cnt);
            while_stack.push_back(label_cnt);
            label_cnt++;
            dbg_ast_printf("ClosedStmt :: = WHILE '(' Exp ')' ClosedStmt;\n");
            std::cout << "  jump " << lable_while_entry << std::endl
                      << std::endl;

            std::cout << lable_while_entry << ":" << std::endl;
            exp->Eval();
            std::cout << "  br " << exp->ident << ", " << lable_while_body << ", " << lable_end << std::endl
                      << std::endl;

            std::cout << lable_while_body << ":" << std::endl;
            is_ret = false;
            closed_stmt1->GenerateIR();
            if (is_ret == false)
                std::cout << "  jump " << lable_while_entry << std::endl;
            std::cout << std::endl;

            std::cout << lable_end << ":" << std::endl;
            is_ret=false;
            while_stack.pop_back();
        }
        else
            assert(false);

    }
};

// SimpleStmt :: = LVal "=" Exp ";" | [Exp] ";" | Block | "return" [Exp] ";";

class SimpleStmtAST : public BaseAST
{
public:
    SimpleStmtType bnf_type;
    std::unique_ptr<BaseExpAST> lval;
    std::unique_ptr<BaseExpAST> exp;
    std::unique_ptr<BaseAST> block;
    void GenerateIR()  override
    {
        if(bnf_type==SimpleStmtType::SSTMT_RETURN)
        {
            dbg_ast_printf("SimpleStmt ::= 'return' Exp ';';\n");
            exp->Eval();
            std::cout << "  ret " << exp->ident << std::endl;
            is_ret = true;
        }
        else if(bnf_type==SimpleStmtType::SSTMT_EMPTY_RET)
        {
            dbg_ast_printf("SimpleStmt ::= 'return' ';';\n");
            std::string ret_type=func_map[current_func];
            if(ret_type=="i32")
                std::cout << "  ret 0" << std::endl;
            else
                std::cout<<"  ret"<<std::endl;
            is_ret = true;
        }
        else if(bnf_type==SimpleStmtType::SSTMT_ASSIGN)
        {
            dbg_ast_printf("SimpleStmt :: = LVal '=' Exp ';'\n");
            exp->Eval();
            lval->is_left=true;
            lval->Eval();
            assert(!lval->is_const);
            exp->GenerateIR();
            symbol_info_t *info=symbol_table_stack.LookUp(lval->ident);
        
            if(info!=nullptr)
                std::cout<<"  store "<<exp->ident<<", "<<info->ir_name<<std::endl;
            else
                std::cout << "  store " << exp->ident << ", " << lval->ident << std::endl;
        }
        else if(bnf_type==SimpleStmtType::SSTMT_BLK)
        {
            dbg_ast_printf("SimpleStmt :: = Block\n");
            symbol_table_stack.PushScope();
            block->GenerateIR();
            symbol_table_stack.PopScope();
        }
        else if(bnf_type==SimpleStmtType::SSTMT_EMPTY_EXP)
        {
            dbg_ast_printf("SimpleStmt :: = ';'\n");
        }
        else if (bnf_type == SimpleStmtType::SSTMT_EXP)
        {
            dbg_ast_printf("SimpleStmt :: = EXP ';'\n");
            exp->Eval();
            exp->GenerateIR();
        }
        else if(bnf_type==SimpleStmtType::SSTMT_BREAK)
        {
            dbg_ast_printf("SimpleStmt :: = BREAK ';'\n");
            assert(!while_stack.empty());
            int label_num=while_stack.back();
            std::cout<<"  jump %_end_"<<std::to_string(label_num)<<std::endl<<std::endl;
            is_ret=true;
        }
        else if(bnf_type==SimpleStmtType::SSTMT_CONTINUE)
        {
            dbg_ast_printf("SimpleStmt :: = CONTINUE ';'\n");
            assert(!while_stack.empty());
            int label_num = while_stack.back();
            std::cout << "  jump %_while_entry_" << std::to_string(label_num) << std::endl
                      << std::endl;
            is_ret=true;
        }
        else
            assert(false);
    }
};

// Exp ::= LOrExp;
class ExpAST : public BaseExpAST
{
public:
    std::unique_ptr<BaseExpAST> lor_exp;
    void GenerateIR() override
    {
        lor_exp->GenerateIR();
    }
    void Eval() override
    {

        if(is_evaled)
            return;
        dbg_ast_printf("Exp ::= LOrExp;\n");
        lor_exp->Eval();
        Copy(lor_exp);
        is_evaled=true;
    }
};

// PrimaryExp :: = "(" Exp ")" | LVal | Number;
class PrimaryExpAST : public BaseExpAST
{
public:
    PrimaryExpType bnf_type;
    std::unique_ptr<BaseExpAST> exp;
    int number;
    std::unique_ptr<BaseExpAST> lval;
    void Eval() override
    {
        if(is_evaled)
            return;
        if (bnf_type == PrimaryExpType::EXP)
        {
            dbg_ast_printf("PrimaryExp :: = '(' Exp ')'\n");
            exp->Eval();
            Copy(exp);
        }
        else if (bnf_type == PrimaryExpType::NUMBER)
        {
            dbg_ast_printf("PrimaryExp :: = Number(%d)\n",number);
            val=number;
            is_const=true;
            ident=std::to_string(val);
        }
        else if(bnf_type==PrimaryExpType::LVAL)
        {
            dbg_ast_printf("PrimaryExp :: = LVal\n");
            lval->Eval();
            Copy(lval);
        }
        else
            assert(false);
        is_evaled=true;
    }
    void GenerateIR()  override
    {

    }
};

// UnaryExp :: = PrimaryExp | IDENT "(" [FuncRParams] ")" | UnaryOp UnaryExp;
class UnaryExpAST : public BaseExpAST
{
public:
    UnaryExpType bnf_type;
    std::unique_ptr<BaseExpAST> primary_exp;
    std::unique_ptr<BaseExpAST> unary_exp;
    std::unique_ptr<ExpVecAST> func_rparams;
    std::string unary_op;
    std::string func_name;
    void Eval() override
    {
        if(is_evaled)
            return;
        if (bnf_type == UnaryExpType::PRIMARY)
        {
            dbg_ast_printf("UnaryExp :: = PrimaryExp\n");
            primary_exp->Eval();
            Copy(primary_exp);
        }
        else if (bnf_type == UnaryExpType::UNARY)
        {
            unary_exp->Eval();
            Copy(unary_exp);
            if(unary_exp->is_const)
            {
                dbg_ast_printf("UnaryExp :: = %s UnaryExp\n", unary_op.c_str());
                if (unary_op == "+")
                {
                    val=unary_exp->val;
                }
                else if (unary_op == "-")
                {
                    val=-unary_exp->val;
                }
                else if (unary_op == "!")
                {
                    val=!unary_exp->val;
                }
                else
                    assert(false);
                ident=std::to_string(val);
            }
            else
            {
                dbg_ast_printf("UnaryExp :: = %s UnaryExp\n", unary_op.c_str());
                if (unary_op == "-")
                {
                    ident = "%" + std::to_string(symbol_cnt);
                    symbol_cnt++;
                    std::cout<<"  "<<ident<<" = sub 0, "<<unary_exp->ident<<std::endl;
                }
                else if (unary_op == "!")
                {
                    ident = "%" + std::to_string(symbol_cnt);
                    symbol_cnt++;
                    std::cout << "  " << ident << " = eq " << unary_exp->ident <<", 0"<< std::endl;
                }
                
            }
            is_evaled = true;
        }
        else if(bnf_type==UnaryExpType::CALL)
        {
            dbg_ast_printf("UnaryExp :: = IDENT '(' [FuncRParams] ')'\n");
            for(auto &param: func_rparams->vec)
                param->Eval();
            
            assert(func_map.find(func_name)!=func_map.end());
            std::string ret_type=func_map[func_name];
            if(ret_type=="i32")
            {
                ident="%"+std::to_string(symbol_cnt);
                symbol_cnt++;
                std::cout<<"  "<<ident<<" = ";
            }
            else if(ret_type=="void")
                std::cout<<"  ";
            else
                assert(false);
            std::cout<<"call @"<<func_name<<"(";
            int cnt=0;
            for (auto &param : func_rparams->vec)
            {
                if(cnt!=0)
                    std::cout<<", ";
                std::cout<<param->ident;
                cnt++;
            }
            std::cout<<")"<<std::endl;
        }
    }
    void GenerateIR()  override
    {

    }
};

// MulExp :: = UnaryExp | MulExp("*" | "/" | "%") UnaryExp;
class MulExpAST : public BaseExpAST
{
public:
    BianryOPExpType bnf_type;
    std::unique_ptr<BaseExpAST> unary_exp;
    std::unique_ptr<BaseExpAST> mul_exp;
    std::string op;
    void Eval() override
    {
        if(is_evaled)
            return;
        if (bnf_type == BianryOPExpType::INHERIT)
        {
            dbg_ast_printf("MulExp :: = UnaryExp;\n");
            unary_exp->Eval();
            Copy(unary_exp);
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            dbg_ast_printf("MulExp :: = MulExp %s UnaryExp;\n", op.c_str());
            mul_exp->Eval();
            unary_exp->Eval();
            is_const=mul_exp->is_const && unary_exp->is_const;
            if(is_const)
            {
                int val1=mul_exp->val,val2=unary_exp->val;
                if(op=="*")
                    val=val1*val2;
                else if(op=="/")
                    val=val1/val2;
                else if(op=="%")
                    val=val1%val2;
                else
                    assert(false);
                ident=std::to_string(val);
            }
            else
            {
                ident="%"+std::to_string(symbol_cnt);
                symbol_cnt++;
                std::cout<<"  "<<ident<<" = "<<op_names[op]<<" "<<mul_exp->ident<<", "<<unary_exp->ident<<std::endl;
            }
        }
        else
            assert(false);
        is_evaled=true;
    }
    void GenerateIR() override
    {
    }
};

// AddExp :: = MulExp | AddExp("+" | "-") MulExp;
class AddExpAST : public BaseExpAST
{
public:
    BianryOPExpType bnf_type;
    std::unique_ptr<BaseExpAST> add_exp;
    std::unique_ptr<BaseExpAST> mul_exp;
    std::string op;
    void Eval() override
    {
        if(is_evaled)
            return;
        if (bnf_type == BianryOPExpType::INHERIT)
        {
            dbg_ast_printf("AddExp :: = MulExp;\n");
            mul_exp->Eval();
            Copy(mul_exp);
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            dbg_ast_printf("AddExp :: = AddExp %s MulExp;\n",  op.c_str());
            add_exp->Eval();
            mul_exp->Eval();
            is_const=add_exp->is_const&&mul_exp->is_const;
            int val1=add_exp->val,val2=mul_exp->val;
            if(is_const)
            {
                if(op=="+")
                    val=val1+val2;
                else if(op=="-")
                    val=val1-val2;
                else
                    assert(false);
                ident=std::to_string(val);
            }
            else
            {
                ident = "%" + std::to_string(symbol_cnt);
                symbol_cnt++;
                std::cout << "  " << ident << " = " << op_names[op] << " " << add_exp->ident << ", " << mul_exp->ident << std::endl;
            }
        }
        else
            assert(false);
        is_evaled=true;
    }
    void GenerateIR() override
    {
        
    }
};

// RelExp :: = AddExp | RelExp("<" | ">" | "<=" | ">=") AddExp;
class RelExpAST : public BaseExpAST
{
public:
    BianryOPExpType bnf_type;
    std::unique_ptr<BaseExpAST> add_exp;
    std::unique_ptr<BaseExpAST> rel_exp;
    std::string op;
    void Eval() override
    {
        if(is_evaled)
            return;
        if (bnf_type == BianryOPExpType::INHERIT)
        {
            dbg_ast_printf("RelExp :: = AddExp;\n");
            add_exp->Eval();
            Copy(add_exp);
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            dbg_ast_printf("RelExp :: = RelExp %s AddExp;\n",op.c_str());
            rel_exp->Eval();
            add_exp->Eval();
            is_const=rel_exp->is_const&&add_exp->is_const;
            if(is_const)
            {
                int val1 = rel_exp->val, val2 = add_exp->val;
                if(op=="<")
                    val=(val1<val2);
                else if(op==">")
                    val=(val1>val2);
                else if(op=="<=")
                    val=(val1<=val2);
                else if(op==">=")
                    val=(val1>=val2);
                else
                    assert(false);
                ident=std::to_string(val);
            }
            else
            {
                ident = "%" + std::to_string(symbol_cnt);
                symbol_cnt++;
                std::cout << "  " << ident << " = " << op_names[op] << " " << rel_exp->ident << ", " << add_exp->ident << std::endl;
            }
        }
        else
            assert(false);
        is_evaled=true;
    }
    void GenerateIR()  override
    {
        
        
    }
};

// EqExp :: = RelExp | EqExp("==" | "!=") RelExp;
class EqExpAST : public BaseExpAST
{
public:
    BianryOPExpType bnf_type;
    std::unique_ptr<BaseExpAST> eq_exp;
    std::unique_ptr<BaseExpAST> rel_exp;
    std::string op;
    void Eval() override
    {
        if(is_evaled)
            return;
        if (bnf_type == BianryOPExpType::INHERIT)
        {
            dbg_ast_printf("EqExp :: = RelExp;\n");
            rel_exp->Eval();
            Copy(rel_exp);
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            dbg_ast_printf("EqExp :: = EqExp %s RelExp;\n", op.c_str());
            eq_exp->Eval();
            rel_exp->Eval();
            is_const=eq_exp->is_const&&rel_exp->is_const;
            if(is_const)
            {
                int val1 = eq_exp->val, val2 = rel_exp->val;
                if (op == "==")
                    val = (val1 == val2);
                else if (op == "!=")
                    val = (val1 != val2);
                else
                    assert(false);
                ident=std::to_string(val);
            }
            else
            {
                ident = "%" + std::to_string(symbol_cnt);
                symbol_cnt++;
                std::cout << "  " << ident << " = " << op_names[op] << " " << eq_exp->ident << ", " << rel_exp->ident << std::endl;
            }
        }
        else
            assert(false);
        is_evaled=true;
    }
    void GenerateIR()  override
    {

    }
};

// LAndExp :: = EqExp | LAndExp "&&" EqExp;
class LAndExpAST : public BaseExpAST
{
public:
    BianryOPExpType bnf_type;
    std::unique_ptr<BaseExpAST> eq_exp;
    std::unique_ptr<BaseExpAST> land_exp;
    void Eval() override
    {
        if (is_evaled)
            return;
        if (bnf_type == BianryOPExpType::INHERIT)
        {
            dbg_ast_printf("LAndExp :: = EqExp;\n");
            eq_exp->Eval();
            Copy(eq_exp);
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            dbg_ast_printf("LAndExp :: = LAndExp '&&' EqExp;\n");
            land_exp->Eval();
            if(land_exp->is_const && land_exp->val==0)
            {
                val=land_exp->val;
                ident = std::to_string(val);
                is_const=true;
                is_evaled=true;
                return;
            }

            std::string lable_then = "%_then_" + std::to_string(label_cnt),
                        lable_else = "%_else_" + std::to_string(label_cnt),
                        lable_end = "%_end_" + std::to_string(label_cnt);
            label_cnt++;

            ident = "t" + std::to_string(alloc_tmp);
            std::string ir_name = "@" + ident;
            ir_name=symbol_table_stack.Insert(ident, ir_name,SYMBOL_TYPE::VAR_SYMBOL);
            alloc_tmp++;
            std::cout << "  " << ir_name << " = alloc i32" << std::endl;

            std::string tmp_var1="%"+std::to_string(symbol_cnt);
            symbol_cnt++;
            std::cout<<"  "<<tmp_var1<<" = ne "<<land_exp->ident<<", 0"<<std::endl;
            std::cout<<"  br "<<tmp_var1<<", "<<lable_then<<", "<<lable_else<<std::endl<<std::endl;
            
            std::cout<<lable_then<<":"<<std::endl;
            eq_exp->Eval();
            std::string tmp_var2 = "%" + std::to_string(symbol_cnt);
            symbol_cnt++;
            std::cout<<"  "<<tmp_var2<<" = ne "<<eq_exp->ident<<", 0"<<std::endl;
            std::cout << "  store " << tmp_var2 << ", " << ir_name<<std::endl;
            std::cout<<"  jump "<<lable_end<<std::endl<<std::endl;

            std::cout<<lable_else<<":"<<std::endl;
            std::cout << "  store 0, " << ir_name<<std::endl;
            std::cout << "  jump " << lable_end << std::endl
                      << std::endl;

            std::cout<<lable_end<<":"<<std::endl;
            ident = "%" + std::to_string(symbol_cnt);
            symbol_cnt++;
            std::cout << "  " << ident << " = load " << ir_name << std::endl;
            if (land_exp->is_const && eq_exp->is_const)
            {
                val = land_exp->val && eq_exp->val;
                ident = std::to_string(val);
                is_const = true;
            }
        }
        else
            assert(false);
        
        is_evaled=true;
    }
    void GenerateIR() override
    {
        
    }
};

// LOrExp :: = LAndExp | LOrExp "||" LAndExp;
class LOrExpAST : public BaseExpAST
{
public:
    BianryOPExpType bnf_type;
    std::unique_ptr<BaseExpAST> land_exp;
    std::unique_ptr<BaseExpAST> lor_exp;
    void Eval() override
    {
        if (is_evaled)
            return;
        if (bnf_type == BianryOPExpType::INHERIT)
        {
            dbg_ast_printf("LOrExp :: = LAndExp;\n");
            land_exp->Eval();
            Copy(land_exp);
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            dbg_ast_printf("LOrExp :: = LOrExp || LAndExp;\n");
            lor_exp->Eval();
            if (lor_exp->is_const && lor_exp->val == 1)
            {
                val = lor_exp->val;
                ident = std::to_string(val);
                is_const=true;
                is_evaled = true;
                return;
            }
            std::string lable_then = "%_then_" + std::to_string(label_cnt),
                        lable_else = "%_else_" + std::to_string(label_cnt),
                        lable_end = "%_end_" + std::to_string(label_cnt);
            
            label_cnt++;
            ident="t" + std::to_string(alloc_tmp);
            std::string ir_name = "@t" + std::to_string(alloc_tmp);
            ir_name=symbol_table_stack.Insert(ident, "@"+ident,SYMBOL_TYPE::VAR_SYMBOL);
            alloc_tmp++;
            std::cout << "  " << ir_name << " = alloc i32" << std::endl;

            std::string tmp_var1 = "%" + std::to_string(symbol_cnt);
            symbol_cnt++;
            std::cout << "  " << tmp_var1 << " = eq " << lor_exp->ident << ", 0" << std::endl;
            std::cout << "  br " << tmp_var1 << ", " << lable_then << ", " << lable_else << std::endl
                      << std::endl;
            
            
            std::cout << lable_then << ":" << std::endl;
            land_exp->Eval();
            std::string tmp_var2 = "%" + std::to_string(symbol_cnt);
            symbol_cnt++;
            std::cout << "  " << tmp_var2 << " = ne " << land_exp->ident << ", 0" << std::endl;
            std::cout<<"  store "<< tmp_var2<<", "<<ir_name<<std::endl;
            std::cout << "  jump " << lable_end << std::endl
                      << std::endl;

            std::cout << lable_else << ":" << std::endl;
            std::cout << "  store 1, "<<ir_name<<std::endl;
            std::cout << "  jump " << lable_end << std::endl
                      << std::endl;

            std::cout << lable_end << ":" << std::endl;
            
            ident = "%" + std::to_string(symbol_cnt);
            symbol_cnt++;
            std::cout<<"  "<<ident<<" = load "<<ir_name<<std::endl;
            if(land_exp->is_const && lor_exp->is_const)
            {
                val=land_exp->val || lor_exp->val;
                ident=std::to_string(val);
                is_const=true;
            }
        }
        else
            assert(false);
        is_evaled=true;
    }
    void GenerateIR()  override
    {
        
    }
};

// Decl :: = ConstDecl | VarDecl;
class DeclAST: public BaseAST
{
public:
    DeclType bnf_type;
    std::unique_ptr<BaseAST> const_decl;
    std::unique_ptr<BaseAST> var_decl;
    void GenerateIR() override
    {
        if(bnf_type==DeclType::CONST_DECL)
        {
            dbg_ast_printf("Decl :: = ConstDecl\n");
            const_decl->is_global=is_global;
            const_decl->GenerateIR();
        }
        else if(bnf_type==DeclType::VAR_DECL)
        {
            dbg_ast_printf("Decl :: = VarDecl\n");
            var_decl->is_global = is_global;
            var_decl->GenerateIR();
        }
        else
            assert(false);
    }

};

// ConstDecl :: = "const" BType ConstDef { "," ConstDef } ";";
class ConstDeclAST : public BaseAST
{
public:
    
    std::unique_ptr<BaseAST> btype;
    std::unique_ptr<VecAST> const_defs;

    void GenerateIR() override
    {
        dbg_ast_printf("ConstDecl :: = 'const' i32 ConstDef { ',' ConstDef } ';'\n");
        for(auto& def: const_defs->vec)
        {
            def->is_global = is_global;
            def->GenerateIR();
        }
    }
};

// ConstDef ::= IDENT {"[" ConstExp "]"} "=" ConstInitVal;
class ConstDefAST: public BaseAST
{
public:
    std::unique_ptr<BaseExpAST> const_init_val;
    std::unique_ptr<ExpVecAST> const_exps;
    InitType bnf_type;
    
    void GenerateIR()  override
    {
        if(bnf_type==InitType::INIT_VAR)
        {
            dbg_ast_printf("ConstDef :: = IDENT '=' ConstInitVal;\n");
            const_init_val->Eval();
            symbol_table_stack.Insert(ident,const_init_val->val);
        }
        else if(bnf_type==InitType::INIT_ARRAY)
        {
            dbg_ast_printf("ConstDef :: = IDENT {'[' ConstExp ']'} '=' ConstInitVal;\n");
            int ndim=0;
            std::vector<int> dims;
            for(auto &exp: const_exps->vec)
            {
                exp->Eval();
                dims.push_back(exp->val);
                ndim++;
            }
            ndarr=new NDimArray(dims,ndim);

            dim_depth=0;
            const_init_val->Eval();
          
            std::string ir_name=symbol_table_stack.Insert(ident,"@"+ident,SYMBOL_TYPE::ARR_SYMBOL,ndim);
            if(is_global)
            {
                std::cout<<"global "<<ir_name<<" = alloc ";
                print_dims(dims,ndim);

                if(ndarr->get_currcnt()==0)
                {
                    std::cout<<", zeroinit"<<std::endl;
                }
                else
                {
                    std::cout<<", ";
                    ndarr->generate_aggregate();
                    std::cout<<std::endl;
                }

            }
            else
            {
                std::cout<<"  "<<ir_name<<" = alloc ";
                print_dims(dims,ndim);
                std::cout<<std::endl;
                ndarr->generate_assign(ir_name);
            }
            
            delete ndarr;
            ndarr=nullptr;
            
        }
    }
};

// ConstInitVal ::= ConstExp | "{" [ConstInitVal {"," ConstInitVal}] "}";
class ConstInitValAST : public BaseExpAST
{
public:
    std::unique_ptr<BaseExpAST> const_exp;
    InitType bnf_type;
    std::unique_ptr<ExpVecAST> const_init_vals;
    
    void GenerateIR()  override
    {
        
    }
    void Eval() override
    {
        
        if(is_evaled)
            return;
        if(bnf_type==InitType::INIT_VAR)
        {
            dbg_ast_printf("ConstInitVal :: = ConstExp;\n");
            const_exp->Eval();
            Copy(const_exp);
            is_evaled=true;
            if(ndarr!=nullptr)
                ndarr->push(const_exp->val);
        }
        else if(bnf_type==InitType::INIT_ARRAY)
        {
            dbg_ast_printf("ConstInitVal :: '{' [ConstInitVal {',' ConstInitVal}] '}'\n");
            int old_depth=dim_depth;
            int align_size=ndarr->get_align(old_depth);
            int old_cnt=ndarr->get_currcnt();
            dim_depth++;
            for(auto& init:const_init_vals->vec)
            {
                init->Eval();
            }
            dim_depth=old_depth;
            int zero_added=align_size-(ndarr->get_currcnt()-old_cnt);
            
            for(int i=0;i<zero_added;++i)
                ndarr->push(0);
            
            is_evaled=true;
            is_const=true;
            
        }
        else
            assert(false);
        
    }
    
};

// BlockItem :: = Decl | Stmt;
class BlockItemAST : public BaseAST
{
public:

    BlockItemType bnf_type;
    std::unique_ptr<BaseAST> decl;
    std::unique_ptr<BaseAST> stmt;
    
    void GenerateIR()  override
    {
        if(bnf_type==BlockItemType::BLK_DECL)
        {
            dbg_ast_printf("BlockItem :: = Decl;\n");
            decl->GenerateIR();
        }
        else if(bnf_type==BlockItemType::BLK_STMT)
        {
            dbg_ast_printf("BlockItem :: = Stmt;\n");
            stmt->GenerateIR();
        }
    }
};

// LVal ::= IDENT {"[" Exp "]"};
class LValAST : public BaseExpAST
{
public:
    LValType bnf_type;
    std::unique_ptr<ExpVecAST> exps;
    void Eval() override
    {
        
        if(is_evaled)
            return;
        if(bnf_type==LValType::LVAL_VAR)
        {
            dbg_ast_printf("LVal :: = IDENT;\n");
            symbol_info_t *info=symbol_table_stack.LookUp(ident);
            assert(info!=nullptr);
            if(!is_left)
            {
                if(info->type==SYMBOL_TYPE::CONST_SYMBOL)
                {
                    val=info->val;
                    ident=std::to_string(val);
                    is_const=true;
                }
                else if(info->type==SYMBOL_TYPE::VAR_SYMBOL)
                {
                    ident="%"+std::to_string(symbol_cnt);
                    symbol_cnt++;
                    std::cout<<"  "<<ident<<" = load "<<info->ir_name<<std::endl;
                }
                else if(info->type==SYMBOL_TYPE::ARR_SYMBOL)
                {
                    ident = "%" + std::to_string(symbol_cnt);
                    symbol_cnt++;
                    std::cout << "  " << ident << " = getelemptr " << info->ir_name << ", 0"<<std::endl;
                }
                else if(info->type==SYMBOL_TYPE::PTR_SYMBOL)
                {
                    ident = "%" + std::to_string(symbol_cnt);
                    symbol_cnt++;
                    std::cout << "  " << ident << " = load " << info->ir_name << std::endl;
                }

            }
        }
        else if(bnf_type==LValType::LVAL_ARRAY)
        {
            dbg_ast_printf("LVal :: = IDENT {'[' Exp ']'};\n");
            std::vector<std::string> dims;
            int ndim=0;
            for(auto &exp: exps->vec)
            {
                exp->Eval();
                dims.push_back(exp->ident);
                ndim++;
            }
            
            symbol_info_t *info=symbol_table_stack.LookUp(ident);
            std::string new_symbol;
            std::string old_symbol=info->ir_name;
            if(info->type==SYMBOL_TYPE::PTR_SYMBOL)
            {
                new_symbol = "%" + std::to_string(symbol_cnt);
                symbol_cnt++;
                std::cout<<"  "<<new_symbol<<" = load "<<info->ir_name<<std::endl;
                old_symbol=new_symbol;
                new_symbol = "%" + std::to_string(symbol_cnt);
                symbol_cnt++;
                std::cout << "  " << new_symbol << " = getptr " << old_symbol << ", " << dims[0] << std::endl;
                old_symbol = new_symbol;
            }
            else if(info->type==SYMBOL_TYPE::ARR_SYMBOL)
            {
                new_symbol = "%" + std::to_string(symbol_cnt);
                symbol_cnt++;
                std::cout << "  " << new_symbol << " = getelemptr " << old_symbol << ", " << dims[0] << std::endl;
                old_symbol = new_symbol;
            }

            for(int i=1;i<ndim;++i)
            {
                new_symbol="%"+std::to_string(symbol_cnt);
                symbol_cnt++;
                std::cout<<"  "<<new_symbol<<" = getelemptr "<<old_symbol<<", "<<dims[i]<<std::endl;
                old_symbol=new_symbol;

            }
        
            if(!is_left and ndim==info->ndim)
            {
                new_symbol = "%" + std::to_string(symbol_cnt);
                symbol_cnt++;
                std::cout<<"  "<<new_symbol<<" = load "<<old_symbol<<std::endl;
            }
            if(!is_left and ndim<info->ndim)
            {
                new_symbol = "%" + std::to_string(symbol_cnt);
                symbol_cnt++;
                std::cout << "  " << new_symbol << " = getelemptr " << old_symbol << ", " << 0 << std::endl;
            }
            ident = new_symbol;
        }


        is_evaled=true;
        
    }
    
    void GenerateIR() override
    {
    }
};


// ConstExp :: = Exp;
class ConstExpAST : public BaseExpAST
{
public:
    std::unique_ptr<BaseExpAST> exp;
    void Eval() override
    {
        if(is_evaled)
            return;
        dbg_ast_printf("ConstExp :: = Exp;\n");
        exp->Eval();
        Copy(exp);
        is_evaled=true;

    }
    
    void GenerateIR()  override
    {   
    }
};

// VarDecl :: = BType VarDef { "," VarDef } ";";
class VarDeclAST: public BaseAST
{
public:
    std::unique_ptr<BaseAST> btype;
    std::unique_ptr<VecAST> var_defs;
    void GenerateIR()  override
    {
        dbg_ast_printf("VarDecl :: = BType VarDef { ',' VarDef } ';';\n");
        for(auto& def: var_defs->vec)
        {
            def->is_global=is_global;
            def->GenerateIR();
        }
    }
};

// VarDef ::= IDENT {"[" ConstExp "]"}
//          | IDENT {"[" ConstExp "]"} "=" InitVal;
class VarDefAST: public BaseAST
{
public:
    VarDefType bnf_type;
    std::unique_ptr<BaseExpAST> init_val;
    std::unique_ptr<ExpVecAST> const_exps;
    void GenerateIR() override
    {
        
        std::string ir_name="@"+ident;
        if(bnf_type==VarDefType::VAR_ASSIGN_VAR)
        {
            dbg_ast_printf("VarDef :: IDENT '=' InitVal;\n");
            ir_name = symbol_table_stack.Insert(ident, ir_name, SYMBOL_TYPE::VAR_SYMBOL);
            if (is_global)
                std::cout << "global ";
            else
                std::cout<<"  ";
            std::cout << ir_name << " = alloc i32";
            if (!is_global)
                std::cout << std::endl;
            init_val->Eval();
            if(is_global)
                std::cout<<", "<<init_val->ident<<std::endl;
            else
                std::cout<<"  "<<"store "<<init_val->ident<<", "<<ir_name<<std::endl;
        }
        else if(bnf_type==VarDefType::VAR)
        {
            dbg_ast_printf("VarDef :: IDENT\n");
            ir_name = symbol_table_stack.Insert(ident, ir_name, SYMBOL_TYPE::VAR_SYMBOL);
            if (is_global)
                std::cout << "global ";
            else
                std::cout << "  ";
            std::cout << ir_name << " = alloc i32";
            if (!is_global)
                std::cout << std::endl;
            if(is_global)
                std::cout<<", zeroinit"<<std::endl;
        }
        else if(bnf_type==VarDefType::VAR_ASSIGN_ARRAY)
        {
            dbg_ast_printf("VarDef :: IDENT '[' ConstExp ']' '=' InitVal;\n");
            dim_depth=0;
            std::vector<int> dims;
            int ndim = 0;
            for (auto &exp : const_exps->vec)
            {
                exp->Eval();
                dims.push_back(exp->val);
                ndim++;
            }
            ir_name = symbol_table_stack.Insert(ident, ir_name, SYMBOL_TYPE::ARR_SYMBOL,ndim);
            ndarr = new NDimArray(dims, ndim);
            init_val->Eval();

            if (is_global)
                std::cout << "global ";
            else
                std::cout << "  ";
            std::cout<<ir_name<<" = alloc ";
            print_dims(dims,ndim);

            int num_assigned = ndarr->get_currcnt();
            if(is_global)
            {
                if(num_assigned==0)
                    std::cout<<", zeroinit"<<std::endl;
                else
                {
                    std::cout<<", ";
                    ndarr->generate_aggregate();
                    std::cout<<std::endl;
                }
            }
            else
            {

                std::cout<<std::endl;
                ndarr->generate_assign(ir_name);
            }
        }
        else if(bnf_type==VarDefType::VAR_ARRAY)
        {
            dbg_ast_printf("VarDef :: IDENT '[' ConstExp ']';\n");
            std::vector<int> dims;
            int ndim = 0;
            for (auto &exp : const_exps->vec)
            {
                exp->Eval();
                ndim++;
                dims.push_back(exp->val);
            }
            ir_name = symbol_table_stack.Insert(ident, ir_name, SYMBOL_TYPE::ARR_SYMBOL,ndim);

            if (is_global)
                std::cout << "global ";
            else
                std::cout << "  ";
            std::cout << ir_name << " = alloc ";
            print_dims(dims,ndim);
            if(is_global)
                std::cout<<", zeroinit";
            std::cout<<std::endl;
        }
        else
            assert(false);
        
        
        delete ndarr;
        ndarr=nullptr;
        
        
    }
};

// InitVal :: = Exp | "{"[InitVal{"," InitVal}] "}";
class InitValAST: public BaseExpAST
{
public:
    std::unique_ptr<BaseExpAST> exp;
    std::unique_ptr<ExpVecAST> init_vals;
    InitType bnf_type;
    void Eval() override
    {
        
        if (is_evaled)
            return;
        if(bnf_type==InitType::INIT_VAR)
        {
            dbg_ast_printf("InitVal :: = Exp;\n");
            exp->Eval();
            Copy(exp);
            is_evaled = true;
            if(ndarr!=nullptr)
                ndarr->push(exp->ident);
        }
        else if(bnf_type==InitType::INIT_ARRAY)
        {
            dbg_ast_printf("InitVal :: = '{' [Exp {',' Exp}] '}';\n");
            int old_cnt = ndarr->get_currcnt();
            int align_size=ndarr->get_align(dim_depth);
            int old_depth=dim_depth;
            dim_depth++;
            for(auto& init: init_vals->vec)
            {
                init->Eval();
            }
            dim_depth=old_depth;
            int zero_added=align_size-(ndarr->get_currcnt()-old_cnt);
            for(int i=0;i<zero_added;++i)
                ndarr->push(0);
            is_evaled=true;
        }
        
    }

    void GenerateIR()  override
    {
    }
};

// FuncFParam ::= BType IDENT ["[" "]" {"[" ConstExp "]"}];
class FuncFParamAST: public BaseAST
{
public:
    std::unique_ptr<BaseAST> btype;
    FuncFParamType bnf_type;
    std::unique_ptr<ExpVecAST> const_exps;
    void GenerateIR() override
    {
        if(bnf_type==FuncFParamType::FUNCF_VAR)
        {
            btype->GenerateIR();
            dbg_ast_printf("FuncFParam ::= BType(%s) IDENT(%s);\n",
                            btype->ident.c_str(),
                            ident.c_str());
            var_type=btype->ident;
            std::string ir_name=symbol_table_stack.Insert("arg_"+ident,"@"+ident,SYMBOL_TYPE::VAR_SYMBOL);
            std::cout<<ir_name<<": "<<btype->ident;
        }
        else if(bnf_type==FuncFParamType::FUNCF_ARR)
        {
            btype->GenerateIR();
            dbg_ast_printf("FuncFParam ::= BType IDENT(%s) '[ ]' { '[' ConstExp ']' };\n",
                           ident.c_str());
            std::vector<int> dims;
            int ndim=0;
            for(auto &exp : const_exps->vec)
            {
                exp->Eval();
                dims.push_back(exp->val);
                ndim++;
            }
            std::string ir_name = symbol_table_stack.Insert("arg_"+ident, "@" + ident, SYMBOL_TYPE::PTR_SYMBOL,ndim);
            this->ndim=ndim;
            this->var_type="*"+get_arr_type(dims,ndim);
            std::cout<<ir_name<<": "<<this->var_type;
            
        }
        
    }
};
