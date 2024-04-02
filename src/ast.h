#pragma once

#include <cassert>
#include <memory>
#include <string>
#include <iostream>
#include <sstream>
#include <map>

/* ENBF */
// CompUnit :: = FuncDef;

// FuncDef :: = FuncType IDENT "("
//                             ")" Block;
// FuncType :: = "int";

// Block :: = "{" Stmt "}";
// Stmt :: = "return" Exp ";";

// Exp :: = LOrExp;
// PrimaryExp :: = "(" Exp ")" | Number;
// Number :: = INT_CONST;
// UnaryExp :: = PrimaryExp | UnaryOp UnaryExp;
// UnaryOp :: = "+" | "-" | "!";
// MulExp :: = UnaryExp | MulExp("*" | "/" | "%") UnaryExp;
// AddExp :: = MulExp | AddExp("+" | "-") MulExp;
// RelExp :: = AddExp | RelExp("<" | ">" | "<=" | ">=") AddExp;
// EqExp :: = RelExp | EqExp("==" | "!=") RelExp;
// LAndExp :: = EqExp | LAndExp "&&" EqExp;
// LOrExp :: = LAndExp | LOrExp "||" LAndExp;

class BaseAST;
class CompUnitAST;
class FuncDefAST;
class FuncTypeAST;
class BlockAST;
class StmtAST;

// Expressions
class ExpAST;
class PrimaryExpAST;
class UnaryExpAST;
class MulExpAST;
class AddExpAST;
class RelExpAST;
class EqExpAST;
class LAndExpAST;
class LOrExpAST;

// enums
enum PrimaryExpType
{
    EXP,
    NUMBER
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

// 所有 AST 的基类
class BaseAST
{
public:
    virtual ~BaseAST() = default;
    virtual void Dump() const = 0;
    virtual std::string GenerateIR() const = 0;
};

// CompUnit 是 BaseAST
// CompUnit :: = FuncDef;
class CompUnitAST : public BaseAST
{
public:
    // 用智能指针管理对象
    std::unique_ptr<BaseAST> func_def;
    void Dump() const override
    {
        std::cout << "CompUnitAST {";
        func_def->Dump();
        std::cout << "}\n";
    }
    std::string GenerateIR() const override
    {
        return func_def->GenerateIR();
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
    void Dump() const override
    {
        std::cout << "FuncDefAST {";
        func_type->Dump();
        std::cout << ", " << ident << ", ";
        block->Dump();
        std::cout << "}";
    }
    std::string GenerateIR() const override
    {
        return "fun @" +
               ident +
               "(): " +
               func_type->GenerateIR() +
               " {\n" +
               block->GenerateIR() +
               "\n}\n";
    }
};

// FuncType ::= "int";
class FuncTypeAST : public BaseAST
{
public:
    std::string type;
    void Dump() const override
    {
        std::cout << "FuncTypeAST {";
        std::cout << type;
        std::cout << "}";
    }
    std::string GenerateIR() const override
    {
        return "i32";
    }
};

// Block ::= "{" Stmt "}";
class BlockAST : public BaseAST
{
public:
    std::unique_ptr<BaseAST> stmt;
    void Dump() const override
    {
        std::cout << "BlockAST {";
        stmt->Dump();
        std::cout << "}";
    }
    std::string GenerateIR() const override
    {
        return "%entry:\n" +
               stmt->GenerateIR();
    }
};

// Stmt ::= "return" Exp ";";
class StmtAST : public BaseAST
{
public:
    std::unique_ptr<BaseAST> exp;
    void Dump() const override
    {
        std::cout << "StmtAST {";
        exp->Dump();
        std::cout << "}";
    }
    std::string GenerateIR() const override
    {
        std::string ret = exp->GenerateIR();
        return get_IR(ret) + "  ret " + get_var(ret);
    }
};

// Exp ::= LOrExp;
class ExpAST : public BaseAST
{
public:
    std::unique_ptr<BaseAST> lor_exp;
    void Dump() const override
    {
        std::cout << "ExpAST {";
        lor_exp->Dump();
        std::cout << "}";
    }
    std::string GenerateIR() const override
    {
        return lor_exp->GenerateIR();
    }
};

// PrimaryExp :: = "(" Exp ")" | Number;
class PrimaryExpAST : public BaseAST
{
public:
    PrimaryExpType bnf_type;
    std::unique_ptr<BaseAST> exp;
    int number;
    void Dump() const override
    {
        std::cout << "PrimaryExpAST {";
        if (bnf_type == PrimaryExpType::EXP)
            exp->Dump();
        else if (bnf_type == PrimaryExpType::NUMBER)
            std::cout << number;
        else
            assert(false);
        std::cout << "}";
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
        return "";
    }
};

// UnaryExp :: = PrimaryExp | UnaryOp UnaryExp;
class UnaryExpAST : public BaseAST
{
public:
    UnaryExpType bnf_type;
    std::unique_ptr<BaseAST> primary_exp;
    std::unique_ptr<BaseAST> unary_exp;
    std::string unary_op;
    void Dump() const override
    {
        std::cout << "UnaryExpAST {";
        if (bnf_type == UnaryExpType::PRIMARY)
            primary_exp->Dump();
        else if (bnf_type == UnaryExpType::UNARY)
        {
            std::cout << unary_op;
            unary_exp->Dump();
        }
        else
            assert(false);
        std::cout << "}";
    }
    std::string GenerateIR() const override
    {
        std::string ret = "";
        if (bnf_type == UnaryExpType::PRIMARY)
            ret = primary_exp->GenerateIR();
        else if (bnf_type == UnaryExpType::UNARY)
        {
            std::string uir = unary_exp->GenerateIR();
            std::string var = get_var(uir);
            std::string ir = get_IR(uir);
            if (unary_op == "+")
            {
                ret = uir;
            }
            else if (unary_op == "-")
            {
                ret =
                    "%" + std::to_string(symbol_cnt) + "\n" +
                    ir +
                    "  %" + std::to_string(symbol_cnt) + " = sub 0, " + var + "\n";
                symbol_cnt++;
            }
            else if (unary_op == "!")
            {
                ret =
                    "%" + std::to_string(symbol_cnt) + "\n" +
                    ir +
                    "  %" + std::to_string(symbol_cnt) + " = eq " + var + ", 0\n";
                symbol_cnt++;
            }
        }
        return ret;
    }
};

// MulExp :: = UnaryExp | MulExp("*" | "/" | "%") UnaryExp;
class MulExpAST : public BaseAST
{
public:
    BianryOPExpType bnf_type;
    std::unique_ptr<BaseAST> unary_exp;
    std::unique_ptr<BaseAST> mul_exp;
    std::string op;
    void Dump() const override
    {
        std::cout << "MulExpAST {";
        if (bnf_type == BianryOPExpType::INHERIT)
            unary_exp->Dump();
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            mul_exp->Dump();
            std::cout << " " << op << " ";
            unary_exp->Dump();
        }
        else
            assert(false);
        std::cout << "}";
    }
    std::string GenerateIR() const override
    {
        std::string ret = "";
        if (bnf_type == BianryOPExpType::INHERIT)
        {
            ret = unary_exp->GenerateIR();
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            std::string l = mul_exp->GenerateIR();
            std::string lvar = get_var(l);
            std::string lir = get_IR(l);
            std::string r = unary_exp->GenerateIR();
            std::string rvar = get_var(r);
            std::string rir = get_IR(r);
            std::string new_var = "%" + std::to_string(symbol_cnt);
            ret = new_var + "\n" +
                  lir +
                  rir +
                  "  " + new_var + " = " + op_names[op] + " " +
                  lvar + ", " + rvar + "\n";
            symbol_cnt++;
        }
        else
            assert(false);
        return ret;
    }
};

// AddExp :: = MulExp | AddExp("+" | "-") MulExp;
class AddExpAST : public BaseAST
{
public:
    BianryOPExpType bnf_type;
    std::unique_ptr<BaseAST> add_exp;
    std::unique_ptr<BaseAST> mul_exp;
    std::string op;
    void Dump() const override
    {
        std::cout << "AddExpAST {";
        if (bnf_type == BianryOPExpType::INHERIT)
            mul_exp->Dump();
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            add_exp->Dump();
            std::cout << " " << op << " ";
            mul_exp->Dump();
        }
        else
            assert(false);
        std::cout << "}";
    }
    std::string GenerateIR() const override
    {
        std::string ret = "";
        if (bnf_type == BianryOPExpType::INHERIT)
        {
            ret = mul_exp->GenerateIR();
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            std::string l = add_exp->GenerateIR();
            std::string lvar = get_var(l);
            std::string lir = get_IR(l);
            std::string r = mul_exp->GenerateIR();
            std::string rvar = get_var(r);
            std::string rir = get_IR(r);
            std::string new_var = "%" + std::to_string(symbol_cnt);
            ret = new_var + "\n" +
                  lir +
                  rir +
                  "  " + new_var + " = " + op_names[op] + " " +
                  lvar + ", " + rvar + "\n";
            symbol_cnt++;
        }
        else
            assert(false);
        return ret;
    }
};

// RelExp :: = AddExp | RelExp("<" | ">" | "<=" | ">=") AddExp;
class RelExpAST : public BaseAST
{
public:
    BianryOPExpType bnf_type;
    std::unique_ptr<BaseAST> add_exp;
    std::unique_ptr<BaseAST> rel_exp;
    std::string op;
    void Dump() const override
    {
        std::cout << "RelExpAST {";
        if (bnf_type == BianryOPExpType::INHERIT)
            add_exp->Dump();
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            rel_exp->Dump();
            std::cout << " " << op << " ";
            add_exp->Dump();
        }
        else
            assert(false);
        std::cout << "}";
    }
    std::string GenerateIR() const override
    {
        std::string ret = "";
        if (bnf_type == BianryOPExpType::INHERIT)
        {
            ret = add_exp->GenerateIR();
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            std::string l = rel_exp->GenerateIR();
            std::string lvar = get_var(l);
            std::string lir = get_IR(l);
            std::string r = add_exp->GenerateIR();
            std::string rvar = get_var(r);
            std::string rir = get_IR(r);
            std::string new_var = "%" + std::to_string(symbol_cnt);
            ret = new_var + "\n" +
                  lir +
                  rir +
                  "  " + new_var + " = " + op_names[op] + " " +
                  lvar + ", " + rvar + "\n";
            symbol_cnt++;
        }
        else
            assert(false);
        return ret;
    }
};

// EqExp :: = RelExp | EqExp("==" | "!=") RelExp;
class EqExpAST : public BaseAST
{
public:
    BianryOPExpType bnf_type;
    std::unique_ptr<BaseAST> eq_exp;
    std::unique_ptr<BaseAST> rel_exp;
    std::string op;
    void Dump() const override
    {
        std::cout << "EqExpAST {";
        if (bnf_type == BianryOPExpType::INHERIT)
            rel_exp->Dump();
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            eq_exp->Dump();
            std::cout << " " << op << " ";
            rel_exp->Dump();
        }
        else
            assert(false);
        std::cout << "}";
    }
    std::string GenerateIR() const override
    {
        std::string ret = "";
        if (bnf_type == BianryOPExpType::INHERIT)
        {
            ret = rel_exp->GenerateIR();
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            std::string l = eq_exp->GenerateIR();
            std::string lvar = get_var(l);
            std::string lir = get_IR(l);
            std::string r = rel_exp->GenerateIR();
            std::string rvar = get_var(r);
            std::string rir = get_IR(r);
            std::string new_var = "%" + std::to_string(symbol_cnt);
            ret = new_var + "\n" +
                  lir +
                  rir +
                  "  " + new_var + " = " + op_names[op] + " " +
                  lvar + ", " + rvar + "\n";
            symbol_cnt++;
        }
        else
            assert(false);
        return ret;
    }
};

// LAndExp :: = EqExp | LAndExp "&&" EqExp;
class LAndExpAST : public BaseAST
{
public:
    BianryOPExpType bnf_type;
    std::unique_ptr<BaseAST> eq_exp;
    std::unique_ptr<BaseAST> land_exp;
    void Dump() const override
    {
        std::cout << "LAndExpAST {";
        if (bnf_type == BianryOPExpType::INHERIT)
            eq_exp->Dump();
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            land_exp->Dump();
            std::cout << " && ";
            eq_exp->Dump();
        }
        else
            assert(false);
        std::cout << "}";
    }
    std::string GenerateIR() const override
    {
        std::string ret = "";
        if (bnf_type == BianryOPExpType::INHERIT)
        {
            ret = eq_exp->GenerateIR();
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            /*
            2 && 4
            %0 = ne 2, 0
            %1 = ne 4, 0
            %2 = and %0, %1
            */
            std::string l = land_exp->GenerateIR();
            std::string lvar = get_var(l);
            std::string lir = get_IR(l);
            std::string r = eq_exp->GenerateIR();
            std::string rvar = get_var(r);
            std::string rir = get_IR(r);
            std::string new_var = "%" + std::to_string(symbol_cnt+2);
            ret = new_var + "\n" +
                  lir +
                  rir +
                  "  %" + std::to_string(symbol_cnt) + " = ne " + lvar + ", 0\n" +
                  "  %" + std::to_string(symbol_cnt + 1) + " = ne " + rvar + ", 0\n" +
                  "  " + new_var + " = " + op_names["&&"] + " %" +
                  std::to_string(symbol_cnt) + ", %" + std::to_string(symbol_cnt + 1) + "\n";
            symbol_cnt+=3;
        }
        else
            assert(false);
        return ret;
    }
};
// LOrExp :: = LAndExp | LOrExp "||" LAndExp;
class LOrExpAST : public BaseAST
{
public:
    BianryOPExpType bnf_type;
    std::unique_ptr<BaseAST> land_exp;
    std::unique_ptr<BaseAST> lor_exp;
    void Dump() const override
    {
        std::cout << "LOrExpAST {";
        if (bnf_type == BianryOPExpType::INHERIT)
            land_exp->Dump();
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            lor_exp->Dump();
            std::cout << " || ";
            land_exp->Dump();
        }
        else
            assert(false);
        std::cout << "}";
    }
    std::string GenerateIR() const override
    {
        std::string ret = "";
        if (bnf_type == BianryOPExpType::INHERIT)
        {
            ret = land_exp->GenerateIR();
        }
        else if (bnf_type == BianryOPExpType::EXPAND)
        {
            /*
            11 || 0
            %0 = ne 11, 0
            %1 = ne 0, 0
            %2 = or %0, %1
            */
            std::string l = lor_exp->GenerateIR();
            std::string lvar = get_var(l);
            std::string lir = get_IR(l);
            std::string r = land_exp->GenerateIR();
            std::string rvar = get_var(r);
            std::string rir = get_IR(r);
            std::string new_var = "%" + std::to_string(symbol_cnt + 2);
            ret = new_var + "\n" +
                  lir +
                  rir +
                  "  %" + std::to_string(symbol_cnt) + " = ne " + lvar + ", 0\n" +
                  "  %" + std::to_string(symbol_cnt + 1) + " = ne " + rvar + ", 0\n" +
                  "  " + new_var + " = " + op_names["||"] + " %" +
                  std::to_string(symbol_cnt) + ", %" + std::to_string(symbol_cnt + 1) + "\n";
            symbol_cnt += 3;
        }
        else
            assert(false);
        return ret;
    }
};

std::string get_var(std::string str)
{
    std::istringstream iss(str);
    std::string var;
    std::getline(iss, var);
    return var;
}

std::string get_IR(std::string str)
{
    std::istringstream iss(str);
    std::string var;
    std::getline(iss, var);

    std::string IR;
    std::string line;
    while (std::getline(iss, line))
    {
        IR += line + "\n";
    }

    return IR;
}