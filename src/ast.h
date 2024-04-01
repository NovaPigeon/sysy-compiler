#pragma once

#include <memory>
#include <string>
#include <iostream>

class BaseAST;
class CompUnitAST;
class FuncDefAST;
class FuncTypeAST;
class BlockAST;
class StmtAST;
class NumberAST;

// 所有 AST 的基类
class BaseAST
{
public:
    virtual ~BaseAST() = default;
    virtual void Dump() const = 0;
    virtual std::string GenerateIR() const = 0;
};

// CompUnit 是 BaseAST
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
        return "fun @"+
                ident+
                "(): "+
                func_type->GenerateIR()+
                " {\n"+
                block->GenerateIR()+
                "\n}\n";
    }
};

class FuncTypeAST:public BaseAST
{
public:
    std::string type;
    void Dump() const override
    {
        std::cout<<"FuncTypeAST {";
        std::cout<<type;
        std::cout << "}";
    }
    std::string GenerateIR() const override
    {
        return "i32";
    }
};

class BlockAST: public BaseAST
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
        return "%entry:\n  "+
               stmt->GenerateIR()+
               "\n";
    }
};

class StmtAST: public BaseAST
{
public:
    std::unique_ptr<BaseAST> number;
    void Dump() const override
    {
        std::cout << "StmtAST {";
        number->Dump();
        std::cout << "}";
    }
    std::string GenerateIR() const override
    {
        return "ret "+
               number->GenerateIR();
    }
};

class NumberAST: public BaseAST
{
public:
    int int_const;
    void Dump() const override
    {
        std::cout << "NumberAST {";
        std::cout << int_const;
        std::cout << "}";
    }
    std::string GenerateIR() const override
    {
        return std::to_string(int_const);
    }
};

