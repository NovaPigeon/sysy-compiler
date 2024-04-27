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

enum StmtType
{
    STMT_ASSIGN,
    STMT_RETURN
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
static std::string get_var(std::string str);
static std::string get_IR(std::string str);


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
    virtual ~BaseAST() = default;
    virtual std::string GenerateIR() const = 0;
};

// 所有 Exp 的基类
class BaseExpAST: public BaseAST
{
public:
    virtual void Eval() =0;
    //bool is_var=false;;
    bool is_const=false;;
    bool is_evaled=false;
    int val=-1;
    void Copy(std::unique_ptr<BaseExpAST>& exp)
    {
        //is_var=exp->is_var;
        is_const=exp->is_const;
        is_evaled=exp->is_evaled;
        val=exp->val;

    }
};

// CompUnit 是 BaseAST
// CompUnit :: = FuncDef;
class CompUnitAST : public BaseAST
{
public:
    // 用智能指针管理对象
    std::unique_ptr<BaseAST> func_def;
    std::string GenerateIR() const override
    {   
        dbg_ast_printf("CompUnit :: = FuncDef;\n");
        func_def->GenerateIR();
        printf("done\n");
        return "";
    }
};

// FuncDef 也是 BaseAST
// FuncDef ::= FuncType IDENT "(" ")" Block;
class FuncDefAST : public BaseAST
{
public:
    std::unique_ptr<BaseAST> func_type;
    std::string ident;
    std::unique_ptr<BaseAST> block;
    std::string GenerateIR() const override
    {
        dbg_ast_printf("FuncDef ::= %s %s '(' ')' Block;\n",ident.c_str(),func_type->GenerateIR().c_str());
        std::cout<<"fun @"
                 <<ident
                 <<"(): ";
        std::cout<<func_type->GenerateIR();
        std::cout << " {" << std::endl;
        block->GenerateIR();
        std::cout << "}" << std::endl;
        return "";
    }
};

// FuncType ::= "int";
class FuncTypeAST : public BaseAST
{
public:
    std::string type;
    std::string GenerateIR() const override
    {
        return "i32";
    }
};

// Block :: = "{" { BlockItem } "}";
class BlockAST : public BaseAST
{
public:
    std::unique_ptr<VecAST> block_items;
    std::string GenerateIR() const override
    {
        dbg_ast_printf("Block :: = '{' { BlockItem } '}'';\n");
        std::cout << "%entry:" << std::endl;
        for(auto &item:block_items->vec)
        {
            item->GenerateIR();
        }
        return "";
    }
};

// Stmt ::= "return" Exp ";";
class StmtAST : public BaseAST
{
public:
    std::unique_ptr<BaseExpAST> exp;
    std::string GenerateIR() const override
    {
        dbg_ast_printf("Stmt ::= 'return' Exp ';';\n");
        exp->Eval();
        std::string var = exp->GenerateIR();
        if(exp->is_const)
        {
            std::cout<<"  ret "<<exp->val<<std::endl;
            return "";
        }
        std::cout << "  ret " << var << std::endl;
        return "";
    }
};

// Exp ::= LOrExp;
class ExpAST : public BaseExpAST
{
public:
    std::unique_ptr<BaseExpAST> lor_exp;
    std::string GenerateIR() const override
    {
        return lor_exp->GenerateIR();
    }
    void Eval() override
    {
        if(is_evaled)
            return;
        lor_exp->Eval();
        Copy(lor_exp);
        dbg_ast_printf("Exp ::= LOrExp(%d);\n",lor_exp->val);
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
            dbg_ast_printf("PrimaryExp :: = '(' Exp(%d) ')'\n", exp->val);
        }
        else if (bnf_type == PrimaryExpType::NUMBER)
        {
            dbg_ast_printf("PrimaryExp :: = Number(%d)\n",number);
            val=number;
            is_const=true;
        }
        else if(bnf_type==PrimaryExpType::LVAL)
        {
            lval->Eval();
            Copy(lval);
            dbg_ast_printf("PrimaryExp :: = LVal(%d)\n",lval->val);
        }
        else
            assert(false);
        is_evaled=true;
    }
    std::string GenerateIR() const override
    {
        if (bnf_type == PrimaryExpType::EXP)
        {
            
            return exp->GenerateIR();
        }
        else if (bnf_type == PrimaryExpType::NUMBER)
        {
            
            return std::to_string(number);
        }
        else if (bnf_type == PrimaryExpType::LVAL)
        {
            
            return lval->GenerateIR();
        }
        else
            assert(false);
        return "";
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
            dbg_ast_printf("UnaryExp :: = PrimaryExp(%d)\n",val);
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
                dbg_ast_printf("UnaryExp :: = %s UnaryExp(%d)\n",unary_op.c_str(),unary_exp->val);
            }
            is_evaled = true;
        }
    }
    std::string GenerateIR() const override
    {
        std::string ret = "";
        if (bnf_type == UnaryExpType::PRIMARY)
        {
            ret = primary_exp->GenerateIR();
        }
        else if (bnf_type == UnaryExpType::UNARY)
        {
            std::string uvar = unary_exp->GenerateIR();
            if(unary_exp->is_const)
                ret=std::to_string(val);

            // if (unary_op == "+")
            // {
            //     ret = uir;
            // }
            // else if (unary_op == "-")
            // {
            //     ret =
            //         "%" + std::to_string(symbol_cnt) + "\n" +
            //         ir +
            //         "  %" + std::to_string(symbol_cnt) + " = sub 0, " + var + "\n";
            //     symbol_cnt++;
            // }
            // else if (unary_op == "!")
            // {
            //     ret =
            //         "%" + std::to_string(symbol_cnt) + "\n" +
            //         ir +
            //         "  %" + std::to_string(symbol_cnt) + " = eq " + var + ", 0\n";
            //     symbol_cnt++;
            // }
        }
        else
            assert(false);
        return ret;
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
            dbg_ast_printf("MulExp :: = UnaryExp(%d);\n",val);
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
                dbg_ast_printf("MulExp :: = MulExp(%d) %s UnaryExp(%d);\n",val1,op.c_str(),val2);
            }

        }
        else
            assert(false);
        is_evaled=true;
    }
    std::string GenerateIR() const override
    {
        // std::string ret = "";
        // if (bnf_type == BianryOPExpType::INHERIT)
        // {
        //     ret = unary_exp->GenerateIR();
        // }
        // else if (bnf_type == BianryOPExpType::EXPAND)
        // {
        //     std::string l = mul_exp->GenerateIR();
        //     std::string lvar = get_var(l);
        //     std::string lir = get_IR(l);
        //     std::string r = unary_exp->GenerateIR();
        //     std::string rvar = get_var(r);
        //     std::string rir = get_IR(r);
        //     std::string new_var = "%" + std::to_string(symbol_cnt);
        //     ret = new_var + "\n" +
        //           lir +
        //           rir +
        //           "  " + new_var + " = " + op_names[op] + " " +
        //           lvar + ", " + rvar + "\n";
        //     symbol_cnt++;
        // }
        // else
        //     assert(false);
        if(is_const)
            return std::to_string(val);
        return "";
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
                dbg_ast_printf("AddExp :: = AddExp(%d) %s MulExp(%d);\n", val1, op.c_str(), val2);
            }
        }
        else
            assert(false);
        is_evaled=true;
    }
    std::string GenerateIR() const override
    {
        if (is_const)
            return std::to_string(val);
        return "";
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
                dbg_ast_printf("RelExp :: = RelExp(%d) %s AddExp(%d);\n",val1,op.c_str(),val2);
            }
        }
        else
            assert(false);
        is_evaled=true;
    }
    std::string GenerateIR() const override
    {
        
        if(is_const)
            return std::to_string(val);
        return "";
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
            dbg_ast_printf("EqExp :: = RelExp(%d);\n",val);
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
                dbg_ast_printf("EqExp :: = EqExp(%d) %s RelExp(%d);",val1,op.c_str(),val2);
            }
        }
        else
            assert(false);
        is_evaled=true;
    }
    std::string GenerateIR() const override
    {
        if (is_const)
            return std::to_string(val);
        return "";
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
            
            land_exp->Eval();
            eq_exp->Eval();
            is_const = eq_exp->is_const && land_exp->is_const;
            if (is_const)
            {
                int val1 = land_exp->val, val2 = eq_exp->val;
                val = (val1 && val2);
                dbg_ast_printf("LAndExp :: = LAndExp(%d) '&&' EqExp(%d);\n",val1,val2);
            }
        }
        else
            assert(false);
        is_evaled=true;
    }
    std::string GenerateIR() const override
    {
        // std::string ret = "";
        // if (bnf_type == BianryOPExpType::INHERIT)
        // {
        //     ret = eq_exp->GenerateIR();
        // }
        // else if (bnf_type == BianryOPExpType::EXPAND)
        // {
        //     /*
        //     2 && 4
        //     %0 = ne 2, 0
        //     %1 = ne 4, 0
        //     %2 = and %0, %1
        //     */
        //     std::string l = land_exp->GenerateIR();
        //     std::string lvar = get_var(l);
        //     std::string lir = get_IR(l);
        //     std::string r = eq_exp->GenerateIR();
        //     std::string rvar = get_var(r);
        //     std::string rir = get_IR(r);
        //     std::string new_var = "%" + std::to_string(symbol_cnt+2);
        //     ret = new_var + "\n" +
        //           lir +
        //           rir +
        //           "  %" + std::to_string(symbol_cnt) + " = ne " + lvar + ", 0\n" +
        //           "  %" + std::to_string(symbol_cnt + 1) + " = ne " + rvar + ", 0\n" +
        //           "  " + new_var + " = " + op_names["&&"] + " %" +
        //           std::to_string(symbol_cnt) + ", %" + std::to_string(symbol_cnt + 1) + "\n";
        //     symbol_cnt+=3;
        // }
        // else
        //     assert(false);
        // return ret;
        if(is_const)
            return std::to_string(val);
        return "";
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
            dbg_ast_printf("LOrExp :: = LAndExp(%d);\n",val);
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            lor_exp->Eval();
            land_exp->Eval();
            is_const = lor_exp->is_const && land_exp->is_const;
            if (is_const)
            {
                int val1 = lor_exp->val, val2 = land_exp->val;
                val = (val1 || val2);
                dbg_ast_printf("LOrExp :: = LOrExp(%d) '||' LAndExp(%d);\n", val1, val2);
            }
            
        }
        else
            assert(false);
        is_evaled=true;
    }
    std::string GenerateIR() const override
    {
        // std::string ret = "";
        // if (bnf_type == BianryOPExpType::INHERIT)
        // {
        //     ret = land_exp->GenerateIR();
        // }
        // else if (bnf_type == BianryOPExpType::EXPAND)
        // {
        //     /*
        //     11 || 0
        //     %0 = ne 11, 0
        //     %1 = ne 0, 0
        //     %2 = or %0, %1
        //     */
        //     std::string l = lor_exp->GenerateIR();
        //     std::string lvar = get_var(l);
        //     std::string lir = get_IR(l);
        //     std::string r = land_exp->GenerateIR();
        //     std::string rvar = get_var(r);
        //     std::string rir = get_IR(r);
        //     std::string new_var = "%" + std::to_string(symbol_cnt + 2);
        //     ret = new_var + "\n" +
        //           lir +
        //           rir +
        //           "  %" + std::to_string(symbol_cnt) + " = ne " + lvar + ", 0\n" +
        //           "  %" + std::to_string(symbol_cnt + 1) + " = ne " + rvar + ", 0\n" +
        //           "  " + new_var + " = " + op_names["||"] + " %" +
        //           std::to_string(symbol_cnt) + ", %" + std::to_string(symbol_cnt + 1) + "\n";
        //     symbol_cnt += 3;
        // }
        // else
        //     assert(false);
        if(is_const)
            return std::to_string(val);
        return "";
    }
};

// Decl :: = ConstDecl | VarDecl;
class DeclAST: public BaseAST
{
public:
    DeclType bnf_type;
    std::unique_ptr<BaseAST> const_decl;
    std::unique_ptr<BaseAST> var_decl;
    std::string GenerateIR() const override
    {
        if(bnf_type==DeclType::CONST_DECL)
        {
            dbg_ast_printf("Decl :: = ConstDecl\n");
            return const_decl->GenerateIR();
        }
        else if(bnf_type==DeclType::VAR_DECL)
        {
            dbg_ast_printf("Decl :: = VarDecl\n");
            return var_decl->GenerateIR();
        }
        return "";
    }

};

// ConstDecl :: = "const" BType ConstDef { "," ConstDef } ";";
class ConstDeclAST : public BaseAST
{
public:
    
    std::unique_ptr<BaseAST> btype;
    std::unique_ptr<VecAST> const_defs;

    std::string GenerateIR() const override
    {
        dbg_ast_printf("ConstDecl :: = 'const' i32 ConstDef { ',' ConstDef } ';'\n");
        for(auto& def: const_defs->vec)
        {
            def->GenerateIR();
        }
        return "";
    }
};

// BType :: = "int";
class BTypeAST: public BaseAST
{
public:
    std::string type;
    std::string GenerateIR() const override
    {
        return "i32";
    }
};

// ConstDef :: = IDENT "=" ConstInitVal;
class ConstDefAST: public BaseAST
{
public:
    std::string ident;
    std::unique_ptr<BaseExpAST> const_init_val;
    
    std::string GenerateIR() const override
    {
        dbg_ast_printf("ConstDef :: = IDENT '=' ConstInitVal;\n");
        const_init_val->Eval();
        const_init_val->GenerateIR();
        symbol_table.Insert(ident,const_init_val->val);
        return "";
    }
};

// ConstInitVal :: = ConstExp;
class ConstInitValAST : public BaseExpAST
{
public:
    std::unique_ptr<BaseExpAST> const_exp;
    
    std::string GenerateIR() const override
    {
        return const_exp->GenerateIR();
    }
    void Eval() override
    {
        if(is_evaled)
            return;
        const_exp->Eval();
        Copy(const_exp);
        dbg_ast_printf("ConstInitVal :: = ConstExp(%d);\n",const_exp->val);
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
    
    std::string GenerateIR() const override
    {
        if(bnf_type==BlockItemType::BLK_DECL)
        {
            dbg_ast_printf("BlockItem :: = Decl;\n");
            return decl->GenerateIR();
        }
        else if(bnf_type==BlockItemType::BLK_STMT)
        {
            dbg_ast_printf("BlockItem :: = Stmt;\n");
            return stmt->GenerateIR();
        }
    }
};

// LVal :: = IDENT;
class LValAST : public BaseExpAST
{
public:
    std::string ident;
    void Eval() override
    {
        if(is_evaled)
            return;
        symbol_info_t *info=symbol_table.LookUp(ident);
        if(info!=nullptr)
        {
            val=info->val;
            is_const=true;
        }
        else
            assert(false);
        dbg_ast_printf("LVal :: = IDENT(%d);\n",val);
        is_evaled=true;
    }
    
    std::string GenerateIR() const override
    {
        if(is_const)
            return std::to_string(val);
        else
            return ident;
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
        dbg_ast_printf("ConstExp :: = Exp(%d);\n",exp->val);
        is_evaled=true;

    }
    
    std::string GenerateIR() const override
    {   
        if(is_const)
            return std::to_string(val);
        return "";
    }
};
