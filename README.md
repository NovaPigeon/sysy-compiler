# 编译原理课程实践报告：年轻人的第一款编译器

信息科学技术学院 2100012945 寿晨宸

## 一、编译器概述

### 1.1 基本功能

本编译器基本具备如下功能：
1. 对 SysY 程序做词法分析和语法分析得到抽象语法树。
2. 对抽象语法树做语义分析生成 Koopa IR。
3. 后端分析 Koopa IR 生成目标的 RISCV 代码。

### 1.2 主要特点

本编译器的主要特点是
- **前后端解耦**：前端通过源程序生成 Koopa IR，后端通过 Koopa IR 生成目标 RISCV 代码，后端并不依赖前端的中间结果。
- **功能区分明确**：词法分析、语法分析、符号表处理、语义分析和目标代码生成分别在不同的文件中用完全解耦的逻辑实现。
- **变量保存在栈上**：Koopa IR 中的所有局部变量都保存在栈上，不做寄存器分配。
- **完全实现SysY语法**：可以编写复杂的 SysY 程序。

## 二、编译器设计

### 2.1 主要模块组成

编译器主要有以下几个模块：
1. **词法分析模块**: `sysy.l`，将 SysY 源程序转换为 token 流。
2. **语法分析模块**: `sysy.y`，`ast.h`/`sysy.y`，将 token 流转换为 `ast.h` 中定义的语法分析树。
3. **语义分析模块**: `ast.h`，遍历语法分析树，生成 Koopa IR。
4. **符号表模块**: `symbol_table.h`/`symbol_table.cpp`，记录符号信息，辅助 Koopa IR 生成。
5. **目标代码生成模块**: `main.cpp`/`riscv.h`/`riscv.cpp`，使用 libkoopa 将 Koopa IR 转换为内存形式，再扫描内存形式的 IR，生成 RISCV 目标代码。

### 2.2 主要数据结构

本编译器最核心的数据结构是 `BaseAST`，是一切抽象语法树的基类。(注：以下省略掉了一些辅助用的成员变量，只体现主要结构)

```c
class BaseAST
{
public:
    virtual ~BaseAST() = default;
    virtual void GenerateIR() = 0;
};
```

对于一般的 `AST` 节点类，一般仿照产生式给出定义。
```
FuncDef ::= FuncType IDENT "(" [FuncFParams] ")" Block;
```
```c
class FuncDefAST : public BaseAST
{
public:
    std::unique_ptr<BaseAST> func_type;
    std::unique_ptr<BaseAST> block;
    std::unique_ptr<VecAST> func_fparams;
    void GenerateIR()  override;
};
```
但是，如果该非终结符有多条生成规则，则定义相应的 `enum` 来识别规则
```c
// Stmt :: = OpenStmt | ClosedStmt;
enum StmtType
{
    STMT_OPEN,
    STMT_CLOSED
};
class StmtAST: public BaseAST
{
public:
    StmtType bnf_type;
    std::unique_ptr<BaseAST> open_stmt;
    std::unique_ptr<BaseAST> closed_stmt;
    void GenerateIR() override;

};
```

对于表达式类型的节点，会以 `ExpBaseAST` 为基类，使用 `Eval` 来做编译期计算。
```c
class BaseExpAST: public BaseAST
{
public:
    virtual void Eval() =0;
    
    bool is_const=false;
    bool is_evaled=false;
    bool is_left=false;
    int val=-1;
    std::vector<int> vals;
    void Copy(std::unique_ptr<BaseExpAST>& exp);
};
```

此外，对于 `Vec`/非定长的 `AST`，我实现了 `VecAST` 和 `ExpVecAST`
```c
class VecAST
{
public:
    std::vector<std::unique_ptr<BaseAST>> vec;
    void push_back(std::unique_ptr<BaseAST> &ast);
};

class ExpVecAST
{
public:
    std::vector<std::unique_ptr<BaseExpAST>> vec;
    void push_back(std::unique_ptr<BaseExpAST> &ast);
};
```

在`if...else...`语句方面，由于涉及到二义性问题，所以本编译器对生成规则做了扩充。

```
Stmt :: = OpenStmt | 
          ClosedStmt;
OpenStmt :: = IF '(' Exp ')' ClosedStmt | 
              IF '(' Exp ')' OpenStmt | 
              IF '(' Exp ')' ClosedStmt ELSE OpenStmt |
              WHILE '(' Exp ')' OpenStmt
ClosedStmt :: = SimpleStmt | 
                IF '(' Exp ')' ClosedStmt ELSE ClosedStmt
SimpleStmt :: = LVal "=" Exp ";" | 
                [Exp] ";" | 
                Block | 
                "return" [Exp] ";";
```

除此之外，为了代码编写的便利性，在编译器的前端部分设计了 

- `class SymbolTable`: 用于记录当前 scope 的符号表。符号表表项的信息如下所示。
    ```c
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
    ```
- `class SymbolTableStack`: 符号表栈，用于维护 scope。
    ```c
    class SymbolTableStack
    {
    private:
        SymbolTable *current_symtab;
    public:
        SymbolTableStack();
        void PopScope();
        void PushScope();
        std::string Insert(std::string symbol, int val);
        std::string Insert(std::string symbol, std::string ir_name,SYMBOL_TYPE type,int ndim=-1);
        bool Exist(std::string symbol);
        symbol_info_t *LookUp(std::string symbol);
    };
    ```
- `class NDimArray`: 方便处理多维数组，不赘述。


后端设计了
- `class StackFrame`: 用于维护当前的栈。
    ```c
    class StackFrame
    {
    public:
        StackFrame();
        void set_stack_size(int size,bool store_ra_,int max_args_num_);
        int push(int size=4);
        int get_stack_size() const;
        bool is_store_ra() const;

    private:
        int stack_size;
        int top;
        bool store_ra;
    };
    ```
- `class RegManager`: 用于维护寄存器的分配，寄存器只分配给临时变量。
    ```c
    class RegManager
    {
    private:
        std::unordered_map<int,bool> regs_occupied;
    public:
        RegManager();
        void free_regs();
        int alloc_reg();
        int alloc_reg(int i);
        void free(int i);
    };
    ```

### 2.3 主要设计考虑及算法选择

#### 2.3.1 符号表的设计考虑

符号表主体采用 `unoredered_map` 实现，其中 `key` 是变量名，`value` 则维护以下信息
- `SYMBOL_TYPE type`: 符号种类，包含以下四种符号：
  - 常量
  - 变量
  - 数组
  - 指针
- `int val`: 为常量维护编译期计算的值。
- `int ndim`: 为数组和指针维护其维数。
- `std::string ir_name`: 为数组/指针/变量维护 Koopa IR 中的变量名。

变量作用域用 `SymbolTableStack` 实现（本质上是链表），每当进入一个新的作用域，就将一个新的 `SymbolTable` `push` 进栈中，并设置新的符号表命名参数。
命名参数为当前符号表在作用域树中的路径（因为嵌套的作用域本质上是树，但是只需要用到一条路径上的节点，所以可以用栈来实现），例如 `0_1_2`。
当插入新的符号时，需要给符号加上命名参数，以实现作用域（不同作用域中的同名符号 `ir_name` 不同，所以本质上是不同的符号）。
当查找符号时，从当前符号表开始向上查找，以实现作用域的覆盖。（外层作用域中的变量可以作用到内层，但优先采用内层作用域的变量；内层作用域的变量无法作用到外层）
当离开作用域时，弹出当前符号表，释放资源。

#### 2.3.2 寄存器分配策略

寄存器分配策略：分配在栈上，寄存器只在目标代码生成中作为中间结果的存储器临时使用。
在函数的开始时，扫描一遍整个函数，计算函数所要用到的栈的大小。
在函数的结尾，恢复栈。
扫描到变量时，计算变量的大小，并将变量压入栈（记录变量和栈地址的映射，然后增加栈顶的值）

#### 2.3.3 采用的优化策略

暂时没有。

#### 2.3.4 其它补充设计考虑

因为代码可能过长，而 `j label` 和 `bnez cond, label` 的范围只能是 `[-2048,2047]` 所以我做了如下替换，使编译器能实现长距离跳转。
- `j label`
    ```riscv
    la t0, label
    jr t0
    ```
- `bnez cond, then; j else;`
    ```riscv
    bnez cond, inter
    la t0, else
    jr t0
    inter:
    la t0, then
    jr t0
    ```

## 三、编译器实现

### 3.1 各阶段编码细节

介绍各阶段实现的时候自己认为有价值的信息，本部分内容**不做特别要求和限制**。可按如下所示的各阶段组织。

#### Lv1. main 函数和 Lv2. 初试目标代码生成

熟悉了 flex/bison 的使用，`ast.h/sysy.l/sysy.y/riscv.cpp` 有了基础的结构，后面就是在这些结构上添加东西。

实现了没什么用的 Dump() 函数和之后很有用的 DumpIR() 函数。

#### Lv3. 表达式

主要难点还是在于优先级的处理，但是相应的 BNF 教程里都有，所以没什么难的。

#### Lv4. 常量和变量

引入了常量和变量，所以添加了符号表的实现。
本来想把常量和变量的 `Eval()` 和 `GenerateIR()` 分开，但发现不太可能，最后写到一起了。
加入了一些自顶向下的信息传递，譬如用于传递某个 `Exp` 是不是 `Const` 的。
引入了 `alloc, load, store` 指令，因此，在目标代码生成时需要考虑变量内存分配和栈帧的问题，从这里往后所有变量都分配在栈上。

#### Lv5. 语句块和作用域

将符号表拓展为符号表栈，具体实现上文中已经讲过了，不再赘述。

#### Lv6. if语句

简单的 `if/else` 生成式会引入 dangling else problem 问题，所以我对生成式做了一些修改，详细情况见上文，消除了二义性。

`if` 语句首次遇到了跳转指令，关于挑战指令的名称，我只是简单地实现为 `%_then_{label_cnt}`。
同时，我还实现了短路求值。（用一些简单的逻辑跳转）


#### Lv7. while语句

控制流没什么好说的，只要将 `while; break; continue;` 语句转换成 `jump` 的形式就好了，跟 `if` 语句的区别不大，最多就是有往回跳转的语句。

#### Lv8. 函数和全局变量

函数的定义与调用中印象比较深刻的：
1. 前端维护一个全局的 `is_ret` 变量，记录当前函数是否已经返回，如果已经返回就立即中断生成 IR，进入下一个函数。
2. 因为要传参，所以 `Prologue` 和 `Epilogue` 变得更加复杂了，还需要维护传参的 ABI。（比如调用函数时，要将前 8 个参数存入对应的寄存器中，剩下的参数放到栈上）
3. 为了方便处理，在函数内将每一个参数都存入一个新的局部变量中。
4. 将所有 SysY 库函数的定义放在代码开头。
5. 对于全局变量和常量，引入 `global/zeroinit/.zero/.word` 等关键词。 

#### Lv9. 数组

数组的实现是比较困难的。
我在前端设计了一个 `NDimArray` 的结构，用于处理多维数组。
当定义一个多维数组时，我根据规则给数组填充零，然后将数组展平为一维向量存入 `NDimArray`，`NDimArray` 里也同时记录数组各维的大小 `dims`。
如果在 global 定义多维数组，则打印数组的规则化 initializer ，将一维向量 reshape 为多维数组。这是比较容易的，可以简化多维数组的数据结构。
如果不是在 global 定义多维数组，那我逐个元素地给数组赋值（先获取多维数组最后一维的指针，再基于该指针的偏移逐个元素赋值就行）。
对于数组参数，只是增加了 `getptr` 的指针运算，但这只需要在解参数时进行一次，解完之后就可以当作数组处理了。
目标代码生成的话，需要根据数组的大小计算偏移量，难度不大。

### 3.2 工具软件介绍（若未使用特殊软件或库，则本部分可略过）
1. `flex`: 词法分析，基于正则表达式匹配，生成 token 流。
2. `Bison`: 语法分析，基于上下文无关文法的 LR 分析，得到语法分析树。
3. `libkoopa`: 将 Koopa IR 的字符表示转化为内存表示，方便处理。
4. `autotest`: 自动化测试。
5. `clang/ld.lld`: 由 RISCV 代码生成二进制文件。
6. `qemu-riscv32-static`: 模拟运行二进制文件。

### 3.3 测试情况说明（如果进行过额外的测试，可增加此部分内容）

使用了一些开源的测试集。
https://github.com/ustb-owl/lava-test
https://github.com/pku-minic/minic-test-cases-2021s
https://github.com/pku-minic/minic-test-cases-2021f

相比于给出的公开测试样例，更加方便 debug。



## 四、实习总结


### 4.1 收获和体会

- 提升了代码能力。
- 对编译器的编写和设计有了细致的了解。
- 熟悉了 `flex/bison` 等工具的使用。

### 4.2 学习过程中的难点，以及对实习过程和内容的建议

难点不是问题，我也很享受自己写编译器的过程，但我觉得教程给的有点过于细致入微了，这导致我日常的思维量和工作量都是集中在一些重复而无趣的工程上。
几乎每一小节，助教都给出了所有的 BNF，我实际上对为什么这样设计 BNF 并没有任何思考（比如表达式的优先级设计）。我只需要机械而重复地将 BNF 填入 `sysy.y`，然后机械而重复地设计 `AST` 就行了。
另外，我觉得实际上可以将优化的部分提前，比如说寄存器分配部分，其实如果一开始就让我实现 LSRA 之类的话，应该也已经写完了。但是等写完之后再去优化，会感觉在改屎山。
虽然但是，编译的任务量已经很大了，再这样改任务量只会更大，我也不知道要怎么才好，只能期待老师和助教们做权衡。


### 4.3 对老师讲解内容与方式的建议

无，已经很好了，如果上课时间不是早八就更好了。
