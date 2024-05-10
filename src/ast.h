#pragma once

#include <cassert>
#include <memory>
#include <string>
#include <iostream>
#include <sstream>
#include <map>
#include <vector>

#include "symbol_table.h"

// #define DEBUG_AST
#ifdef DEBUG_AST
#define dbg_ast_printf(...) fprintf(stderr, __VA_ARGS__)
#else
#define dbg_ast_printf(...)
#endif

class BaseAST;
class VecAST;
class BaseExpAST;

class CompUnitAST;
class FuncDefAST;
class FuncTypeAST;
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
class BTypeAST;
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
    UNARY
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
    SSTMT_BLK
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
    OSTMT_ELSE
};

enum ClosedStmtType
{
    CSTMT_SIMPLE,
    CSTMT_ELSE
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
// static std::string get_var(std::string str);
// static std::string get_IR(std::string str);

class VecAST
{
public:
    std::vector<std::unique_ptr<BaseAST>> vec;
    void push_back(std::unique_ptr<BaseAST> &ast)
    {
        vec.push_back(std::move(ast));
    }

};

// 所有 AST 的基类
class BaseAST
{
public:
    std::string ident = "";
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
// CompUnit :: = FuncDef;
class CompUnitAST : public BaseAST
{
public:
    // 用智能指针管理对象
    std::unique_ptr<BaseAST> func_def;
    void GenerateIR()  override
    {   
        dbg_ast_printf("CompUnit :: = FuncDef;\n");
        func_def->GenerateIR();
    }
};

// FuncDef 也是 BaseAST
// FuncDef ::= FuncType IDENT "(" ")" Block;
class FuncDefAST : public BaseAST
{
public:
    std::unique_ptr<BaseAST> func_type;
    std::unique_ptr<BaseAST> block;
    void GenerateIR()  override
    {
        func_type->GenerateIR();
        dbg_ast_printf("FuncDef ::= %s %s '(' ')' Block;\n",ident.c_str(),func_type->ident.c_str());
        std::cout<<"fun @"
                 <<ident
                 <<"(): ";
        std::cout<<func_type->ident;
        std::cout << " {" << std::endl;
        std::cout << "%entry:" << std::endl;
        block->GenerateIR();
        std::cout << "}" << std::endl;
    }
};

// FuncType ::= "int";
class FuncTypeAST : public BaseAST
{
public:
    std::string type;
    void GenerateIR() override
    {
        ident= "i32";
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
//               IF '(' Exp ')' ClosedStmt ELSE OpenStmt;

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
                    lable_end = "%end_" + std::to_string(label_cnt);
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
            std::cout << "  ret 0" << std::endl;
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
        lor_exp->Eval();
        Copy(lor_exp);
        dbg_ast_printf("Exp ::= LOrExp(%s);\n",ident.c_str());
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
            exp->Eval();
            Copy(exp);
            dbg_ast_printf("PrimaryExp :: = '(' Exp(%s) ')'\n", ident.c_str());
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
            lval->Eval();
            Copy(lval);
            dbg_ast_printf("PrimaryExp :: = LVal(%s)\n", ident.c_str());
        }
        else
            assert(false);
        is_evaled=true;
    }
    void GenerateIR()  override
    {

    }
};

// UnaryExp :: = PrimaryExp | UnaryOp UnaryExp;
class UnaryExpAST : public BaseExpAST
{
public:
    UnaryExpType bnf_type;
    std::unique_ptr<BaseExpAST> primary_exp;
    std::unique_ptr<BaseExpAST> unary_exp;
    std::string unary_op;
    void Eval() override
    {
        if(is_evaled)
            return;
        if (bnf_type == UnaryExpType::PRIMARY)
        {
            primary_exp->Eval();
            Copy(primary_exp);
            dbg_ast_printf("UnaryExp :: = PrimaryExp(%s)\n", ident.c_str());
        }
        else if (bnf_type == UnaryExpType::UNARY)
        {
            unary_exp->Eval();
            Copy(unary_exp);
            if(unary_exp->is_const)
            {
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
                dbg_ast_printf("UnaryExp :: = %s UnaryExp(%d)\n",unary_op.c_str(),unary_exp->val);
            }
            else
            {   
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
                
                dbg_ast_printf("UnaryExp :: = %s UnaryExp(%s)\n",unary_op.c_str(),unary_exp->ident.c_str());
                
            }
            is_evaled = true;
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
            unary_exp->Eval();
            Copy(unary_exp);
            dbg_ast_printf("MulExp :: = UnaryExp(%s);\n", ident.c_str());
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
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
            dbg_ast_printf("MulExp :: = MulExp(%s) %s UnaryExp(%s);\n", mul_exp->ident.c_str(), op.c_str(), unary_exp->ident.c_str());
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
            
            mul_exp->Eval();
            Copy(mul_exp);
            dbg_ast_printf("AddExp :: = MulExp(%d);\n",val);
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
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
            dbg_ast_printf("AddExp :: = AddExp(%s) %s MulExp(%s);\n", add_exp->ident.c_str(), op.c_str(), mul_exp->ident.c_str());
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
            add_exp->Eval();
            Copy(add_exp);
            dbg_ast_printf("RelExp :: = AddExp(%d);\n",val);
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
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
            dbg_ast_printf("RelExp :: = RelExp(%s) %s AddExp(%s);\n", rel_exp->ident.c_str(), op.c_str(), add_exp->ident.c_str());
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
            
            rel_exp->Eval();
            Copy(rel_exp);
            dbg_ast_printf("EqExp :: = RelExp(%s);\n",ident.c_str());
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            
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
            dbg_ast_printf("EqExp :: = EqExp(%s) %s RelExp(%s);\n", eq_exp->ident.c_str(),op.c_str(),rel_exp->ident.c_str());
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
            eq_exp->Eval();
            Copy(eq_exp);
            dbg_ast_printf("LAndExp :: = EqExp(%s);\n",ident.c_str());
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
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
            dbg_ast_printf("LAndExp :: = LAndExp(%s) '&&' EqExp(%s);\n", land_exp->ident.c_str(), eq_exp->ident.c_str());
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
            land_exp->Eval();
            Copy(land_exp);
            dbg_ast_printf("LOrExp :: = LAndExp(%s);\n",ident.c_str());
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
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

            dbg_ast_printf("LOrExp :: = LOrExp(%s) || LAndExp(%s);\n",lor_exp->ident.c_str(),land_exp->ident.c_str());
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
            const_decl->GenerateIR();
        }
        else if(bnf_type==DeclType::VAR_DECL)
        {
            dbg_ast_printf("Decl :: = VarDecl\n");
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
            def->GenerateIR();
        }
    }
};

// BType :: = "int";
class BTypeAST: public BaseAST
{
public:
    std::string type;
    void GenerateIR()  override
    {
        ident="i32";
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
        const_exp->Eval();
        Copy(const_exp);
        dbg_ast_printf("ConstInitVal :: = ConstExp(%s);\n",const_exp->ident.c_str());
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

        dbg_ast_printf("LVal :: = IDENT(%s);\n", info->ir_name.c_str());

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
        exp->Eval();
        Copy(exp);
        dbg_ast_printf("ConstExp :: = Exp(%s);\n",ident.c_str());
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
        std::string ir_name="@"+ident;
        ir_name=symbol_table_stack.Insert(ident,ir_name);
        std::cout<<"  "<<ir_name<<" = alloc i32"<<std::endl;
        if(bnf_type==VarDefType::VAR_ASSIGN)
        {
            dbg_ast_printf("VarDef :: IDENT '=' InitVal;\n");
            init_val->Eval();
            std::cout<<"  "<<"store "<<init_val->ident<<", "<<ir_name<<std::endl;
        }
        else
        {
            dbg_ast_printf("VarDef :: IDENT\n");
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
