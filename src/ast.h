#pragma once

#include <cassert>
#include <memory>
#include <string>
#include <iostream>
#include <sstream>
#include <map>
#include <vector>

#include "symbol_table.h"

#define DEBUG_AST
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
    VAR_ASSIGN
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
        symbol_table_stack.PushScope();
        //initSysyRuntimeLib();
        for(auto &item:comp_units->vec)
        {
            item->is_global=true;
            item->GenerateIR();
        }
        symbol_table_stack.PopScope();
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
        std::cout<<"fun @"<<ident<<"(";

        int cnt=0;
        for(auto &param: func_fparams->vec)
        {
            if(cnt!=0)
                std::cout<<", ";
            param->GenerateIR();
            params.push_back(param->ident);
            cnt++;
        }

        std::cout<<")";
        if(func_type->ident=="i32")
            std::cout<<": "<<func_type->ident;
        std::cout << " {" << std::endl;
        std::cout << "%entry:" << std::endl;

        for(auto& param: params)
        {
            symbol_table_stack.Insert(param, "%" + param);
            symbol_info_t* info=symbol_table_stack.LookUp(param);
            std::cout<<"  "<<info->ir_name<<" = alloc i32"<<std::endl;
            std::cout<<"  store @"<<param<<", "<<info->ir_name<<std::endl;
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
        std::string lable_then = "%then_" + std::to_string(label_cnt),
                    lable_else = "%else_" + std::to_string(label_cnt),
                    lable_end = "%end_" + std::to_string(label_cnt),
                    lable_while_entry = "%while_entry_" + std::to_string(label_cnt),
                    lable_while_body = "%while_body_" + std::to_string(label_cnt);
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
            std::string lable_then = "%then_" + std::to_string(label_cnt),
                        lable_else = "%else_" + std::to_string(label_cnt),
                        lable_end = "%end_" + std::to_string(label_cnt);
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
            std::string lable_end = "%end_" + std::to_string(label_cnt),
                        lable_while_entry = "%while_entry_" + std::to_string(label_cnt),
                        lable_while_body = "%while_body_" + std::to_string(label_cnt);
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
            std::cout<<"  store "<<exp->ident<<", "<<info->ir_name<<std::endl;
            
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
            std::cout<<"  jump %end_"<<std::to_string(label_num)<<std::endl<<std::endl;
            is_ret=true;
        }
        else if(bnf_type==SimpleStmtType::SSTMT_CONTINUE)
        {
            dbg_ast_printf("SimpleStmt :: = CONTINUE ';'\n");
            assert(!while_stack.empty());
            int label_num = while_stack.back();
            std::cout << "  jump %while_entry_" << std::to_string(label_num) << std::endl
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

            std::string lable_then = "%then_" + std::to_string(label_cnt),
                        lable_else = "%else_" + std::to_string(label_cnt),
                        lable_end = "%end_" + std::to_string(label_cnt);
            label_cnt++;

            ident = "t" + std::to_string(alloc_tmp);
            std::string ir_name = "@" + ident;
            symbol_table_stack.Insert(ident, ir_name);
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
            std::string lable_then = "%then_" + std::to_string(label_cnt),
                        lable_else = "%else_" + std::to_string(label_cnt),
                        lable_end = "%end_" + std::to_string(label_cnt);
            
            label_cnt++;

            std::string ir_name = "@t" + std::to_string(alloc_tmp);
            symbol_table_stack.Insert(ident, ir_name);
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

// ConstDef :: = IDENT "=" ConstInitVal;
class ConstDefAST: public BaseAST
{
public:
    std::unique_ptr<BaseExpAST> const_init_val;
    
    void GenerateIR()  override
    {
        dbg_ast_printf("ConstDef :: = IDENT '=' ConstInitVal;\n");
        const_init_val->Eval();
        symbol_table_stack.Insert(ident,const_init_val->val);
    }
};

// ConstInitVal :: = ConstExp;
class ConstInitValAST : public BaseExpAST
{
public:
    std::unique_ptr<BaseExpAST> const_exp;
    
    void GenerateIR()  override
    {
        
    }
    void Eval() override
    {
        if(is_evaled)
            return;
        dbg_ast_printf("ConstInitVal :: = ConstExp;\n");
        const_exp->Eval();
        Copy(const_exp);
        is_evaled=true;
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

// LVal :: = IDENT;
class LValAST : public BaseExpAST
{
public:
    void Eval() override
    {
        if(is_evaled)
            return;
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

// VarDef :: = IDENT | IDENT "=" InitVal;
class VarDefAST: public BaseAST
{
public:
    VarDefType bnf_type;
    std::unique_ptr<BaseExpAST> init_val;
    void GenerateIR() override
    {
        if(is_global)
            std::cout<<"global ";
        std::string ir_name="@"+ident;
        ir_name=symbol_table_stack.Insert(ident,ir_name);
        if(!is_global)
            std::cout<<"  ";
        std::cout<<ir_name<<" = alloc i32";
        if(!is_global)
            std::cout << std::endl;
        if(bnf_type==VarDefType::VAR_ASSIGN)
        {
            dbg_ast_printf("VarDef :: IDENT '=' InitVal;\n");
            init_val->Eval();
            if(is_global)
                std::cout<<", "<<init_val->ident<<std::endl;
            else
                std::cout<<"  "<<"store "<<init_val->ident<<", "<<ir_name<<std::endl;
        }
        else
        {
            dbg_ast_printf("VarDef :: IDENT\n");
            if(is_global)
                std::cout<<", zeroinit"<<std::endl;
        }
    }
};

// InitVal :: = Exp;
class InitValAST: public BaseExpAST
{
public:
    std::unique_ptr<BaseExpAST> exp;
    void Eval() override
    {
        if (is_evaled)
            return;
        exp->Eval();
        Copy(exp);
        dbg_ast_printf("InitVal :: = Exp(%s);\n", exp->ident.c_str());
        is_evaled = true;
    }

    void GenerateIR()  override
    {
    }
};

// FuncFParam :: = BType IDENT;
class FuncFParamAST: public BaseAST
{
public:
    std::unique_ptr<BaseAST> btype;
    void GenerateIR() override
    {
        btype->GenerateIR();
        dbg_ast_printf("FuncFParam ::= BType(%s) IDENT(%s)\n;",
                        btype->ident.c_str(),
                        ident.c_str());
        std::cout<<"@"<<ident<<": "<<btype->ident;
        
    }
};
