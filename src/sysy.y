%code requires {
  #include <memory>
  #include <string>
  #include <ast.h>
}

%{

#include <iostream>
#include <memory>
#include <string>
#include <ast.h>

// 声明 lexer 函数和错误处理函数
int yylex();
void yyerror(std::unique_ptr<BaseAST> &ast, const char *s);

using namespace std;

%}

// 定义 parser 函数和错误处理函数的附加参数
// 我们需要返回一个字符串作为 AST, 所以我们把附加参数定义成字符串的智能指针
// 解析完成后, 我们要手动修改这个参数, 把它设置成解析得到的字符串
%parse-param { std::unique_ptr<BaseAST> &ast }

// yylval 的定义, 我们把它定义成了一个联合体 (union)
// 因为 token 的值有的是字符串指针, 有的是整数
// 之前我们在 lexer 中用到的 str_val 和 int_val 就是在这里被定义的
// 至于为什么要用字符串指针而不直接用 string 或者 unique_ptr<string>?
// 请自行 STFW 在 union 里写一个带析构函数的类会出现什么情况
%union {
  std::string *str_val;
  int int_val;
  BaseAST *ast_val;
  BaseExpAST *exp_val;
  VecAST *vec_val;
  ExpVecAST *exp_vec_val;
}


// lexer 返回的所有 token 种类的声明
// 注意 IDENT 和 INT_CONST 会返回 token 的值, 分别对应 str_val 和 int_val
%token INT VOID RETURN CONST IF ELSE WHILE BREAK CONTINUE
%token <str_val> IDENT
%token <int_val> INT_CONST
%token <str_val> LE GE EQ NEQ AND OR

// 非终结符的类型定义
%type <ast_val> FuncDef Type Block Stmt
%type <ast_val> Decl ConstDecl ConstDef BlockItem VarDef VarDecl
%type <exp_val> Exp PrimaryExp UnaryExp MulExp 
%type <exp_val> AddExp RelExp EqExp LAndExp LOrExp
%type <exp_val> ConstInitVal LVal ConstExp InitVal
%type <vec_val> BlockItems ConstDefs VarDefs
%type <str_val> UnaryOP MulOP AddOP RelOP EqOP
%type <int_val> Number
%type <ast_val> OpenStmt ClosedStmt SimpleStmt
%type <vec_val> FuncFParams CompUnits
%type <exp_vec_val> FuncRParams
%type <ast_val> FuncFParam
%type <exp_vec_val> ConstExpArrs ConstInitVals InitVals ExpArrs


%%

// 开始符, CompUnit ::= FuncDef, 大括号后声明了解析完成后 parser 要做的事情
// 之前我们定义了 FuncDef 会返回一个 str_val, 也就是字符串指针
// 而 parser 一旦解析完 CompUnit, 就说明所有的 token 都被解析了, 即解析结束了
// 此时我们应该把 FuncDef 返回的结果收集起来, 作为 AST 传给调用 parser 的函数
// $1 指代规则里第一个符号的返回值, 也就是 FuncDef 的返回值
CompUnit
  : CompUnits {
    auto comp_unit=make_unique<CompUnitAST>();
    comp_unit->comp_units=unique_ptr<VecAST>($1);
    ast=move(comp_unit);
  }
  ;

CompUnits 
  : FuncDef {
    auto comp_units = new VecAST();
    auto func_def=unique_ptr<BaseAST>($1);
    comp_units->push_back(func_def);
    $$=comp_units;
  }
  | Decl {
    auto comp_units = new VecAST();
    auto decl=unique_ptr<BaseAST>($1);
    comp_units->push_back(decl);
    $$=comp_units;
  }
  | CompUnits FuncDef {
    auto comp_units = ($1);
    auto func_def=unique_ptr<BaseAST>($2);
    comp_units->push_back(func_def);
    $$=comp_units;
  }
  | CompUnits Decl {
    auto comp_units = ($1);
    auto decl=unique_ptr<BaseAST>($2);
    comp_units->push_back(decl);
    $$=comp_units;
  }
  ;

// FuncDef ::= Type IDENT '(' ')' Block;
// 我们这里可以直接写 '(' 和 ')', 因为之前在 lexer 里已经处理了单个字符的情况
// 解析完成后, 把这些符号的结果收集起来, 然后拼成一个新的字符串, 作为结果返回
// $$ 表示非终结符的返回值, 我们可以通过给这个符号赋值的方法来返回结果
// 你可能会问, Type, IDENT 之类的结果已经是字符串指针了
// 为什么还要用 unique_ptr 接住它们, 然后再解引用, 把它们拼成另一个字符串指针呢
// 因为所有的字符串指针都是我们 new 出来的, new 出来的内存一定要 delete
// 否则会发生内存泄漏, 而 unique_ptr 这种智能指针可以自动帮我们 delete
// 虽然此处你看不出用 unique_ptr 和手动 delete 的区别, 但当我们定义了 AST 之后
// 这种写法会省下很多内存管理的负担
FuncDef
  : Type IDENT '(' ')' Block {
    auto funcdef = new FuncDefAST();
    funcdef->func_type = unique_ptr<BaseAST>($1);
    funcdef->ident = *unique_ptr<string>($2);
    funcdef->block = unique_ptr<BaseAST>($5);
    funcdef->func_fparams=unique_ptr<VecAST>(new VecAST());
    $$ = funcdef;
  }
  | Type IDENT '(' FuncFParams ')' Block {
    auto funcdef = new FuncDefAST();
    funcdef->func_type = unique_ptr<BaseAST>($1);
    funcdef->ident = *unique_ptr<string>($2);
    funcdef->block = unique_ptr<BaseAST>($6);
    funcdef->func_fparams=unique_ptr<VecAST>($4);
    $$ = funcdef;
  }
  ;

FuncFParams
  : FuncFParam {
    auto params=new VecAST();
    auto func_fparam=unique_ptr<BaseAST>($1);
    params->push_back(func_fparam);
    $$=params;
  }
  | FuncFParams ',' FuncFParam {
    auto params=($1);
    auto func_fparam=unique_ptr<BaseAST>($3);
    params->push_back(func_fparam);
    $$=params;
  }
  ;

FuncFParam
  : Type IDENT {
    auto func_fparam=new FuncFParamAST();
    func_fparam->btype=unique_ptr<BaseAST>($1);
    func_fparam->ident=*unique_ptr<string>($2);
    func_fparam->bnf_type=FuncFParamType::FUNCF_VAR;
    $$=func_fparam;
  }
  | Type IDENT '[' ']' ConstExpArrs {
    auto func_fparam=new FuncFParamAST();
    func_fparam->btype=unique_ptr<BaseAST>($1);
    func_fparam->ident=*unique_ptr<string>($2);
    func_fparam->const_exps=unique_ptr<ExpVecAST>($5);
    func_fparam->bnf_type=FuncFParamType::FUNCF_ARR;
    $$=func_fparam;
  }
  | Type IDENT '[' ']' {
    auto func_fparam=new FuncFParamAST();
    func_fparam->btype=unique_ptr<BaseAST>($1);
    func_fparam->ident=*unique_ptr<string>($2);
    func_fparam->const_exps=unique_ptr<ExpVecAST>(new ExpVecAST());
    func_fparam->bnf_type=FuncFParamType::FUNCF_ARR;
    $$=func_fparam;
  }
  ;

// 同上, 不再解释
Type
  : INT {
    auto functype=new TypeAST();
    functype->type="int";
    $$ = functype;
  }
  | VOID {
    auto functype=new TypeAST();
    functype->type="void";
    $$ = functype;
  }
  ;

Block
  : '{' BlockItems '}' {
    auto block=new BlockAST();
    block->block_items=unique_ptr<VecAST>($2);
    $$=block;
  }
  | '{' '}' {
    auto block=new BlockAST();
    block->block_items=unique_ptr<VecAST>(new VecAST());
    $$=block;
  }
  ;

BlockItems
  : BlockItem {
    auto items=new VecAST();
    auto block_item=unique_ptr<BaseAST>($1);
    items->push_back(block_item);
    $$=items;
  }
  | BlockItems BlockItem {
    auto items=($1);
    auto block_item=unique_ptr<BaseAST>($2);
    items->push_back(block_item);
    $$=items;
  }
  ;

BlockItem
  : Stmt {
    auto block_item=new BlockItemAST();
    block_item->stmt=unique_ptr<BaseAST>($1);;
    block_item->bnf_type=BlockItemType::BLK_STMT;
    $$=block_item;
  }
  | Decl {
    auto block_item=new BlockItemAST();
    block_item->decl=unique_ptr<BaseAST>($1);
    block_item->bnf_type=BlockItemType::BLK_DECL;
    $$=block_item;
  }
  ;

Stmt
  : OpenStmt {
    auto stmt=new StmtAST();
    stmt->bnf_type=StmtType::STMT_OPEN;
    stmt->open_stmt=unique_ptr<BaseAST>($1);
    $$=stmt;
  }
  | ClosedStmt {
    auto stmt=new StmtAST();
    stmt->bnf_type=StmtType::STMT_CLOSED;
    stmt->closed_stmt=unique_ptr<BaseAST>($1);
    $$=stmt;
  }
  ;

SimpleStmt
  : RETURN Exp ';' {
    auto stmt=new SimpleStmtAST();
    stmt->bnf_type=SimpleStmtType::SSTMT_RETURN;
    stmt->exp=unique_ptr<BaseExpAST>($2);
    $$=stmt;
  }
  | LVal '=' Exp ';' {
    auto stmt=new SimpleStmtAST();
    stmt->bnf_type=SimpleStmtType::SSTMT_ASSIGN;
    stmt->lval=unique_ptr<BaseExpAST>($1);
    stmt->exp=unique_ptr<BaseExpAST>($3);
    $$=stmt;
  }
  | ';' {
    auto stmt=new SimpleStmtAST();
    stmt->bnf_type=SimpleStmtType::SSTMT_EMPTY_EXP;
    $$=stmt;
  }
  | Exp ';' {
    auto stmt=new SimpleStmtAST();
    stmt->bnf_type=SimpleStmtType::SSTMT_EXP;
    stmt->exp=unique_ptr<BaseExpAST>($1);
    $$=stmt;
  }
  | Block {
    auto stmt=new SimpleStmtAST();
    stmt->bnf_type=SimpleStmtType::SSTMT_BLK;
    stmt->block=unique_ptr<BaseAST>($1);
    $$=stmt;
  }
  | RETURN ';' {
    auto stmt=new SimpleStmtAST();
    stmt->bnf_type=SimpleStmtType::SSTMT_EMPTY_RET;
    $$=stmt;
  }
  | BREAK ';' {
    auto stmt=new SimpleStmtAST();
    stmt->bnf_type=SimpleStmtType::SSTMT_BREAK;
    $$=stmt;
  }
  | CONTINUE ';' {
     auto stmt=new SimpleStmtAST();
    stmt->bnf_type=SimpleStmtType::SSTMT_CONTINUE;
    $$=stmt;
  }
  ;

Exp
  : LOrExp {
    auto exp=new ExpAST();
    exp->lor_exp=unique_ptr<BaseExpAST>($1);
    $$=exp;
  }
  ;

PrimaryExp
  : '(' Exp ')' {
    auto primary_exp=new PrimaryExpAST();
    primary_exp->exp=unique_ptr<BaseExpAST>($2);
    primary_exp->bnf_type=PrimaryExpType::EXP;
    $$=primary_exp;
  }
  | Number {
    auto primary_exp=new PrimaryExpAST();
    primary_exp->number=($1);
    primary_exp->bnf_type=PrimaryExpType::NUMBER;
    $$=primary_exp;
  }
  | LVal {
    auto primary_exp=new PrimaryExpAST();
    primary_exp->lval=unique_ptr<BaseExpAST>($1);
    primary_exp->bnf_type=PrimaryExpType::LVAL;
    $$=primary_exp;

  }
  ;

UnaryExp
  : PrimaryExp {
    auto unary_exp=new UnaryExpAST();
    unary_exp->primary_exp=unique_ptr<BaseExpAST>($1);
    unary_exp->bnf_type=UnaryExpType::PRIMARY;
    $$=unary_exp;

  }
  | UnaryOP UnaryExp {
    auto unary_exp=new UnaryExpAST();
    unary_exp->unary_op=*unique_ptr<string>($1);
    unary_exp->unary_exp=unique_ptr<BaseExpAST>($2);
    unary_exp->bnf_type=UnaryExpType::UNARY;
    $$=unary_exp;
  }
  | IDENT '(' ')' {
    auto unary_exp=new UnaryExpAST();
    unary_exp->func_name=*unique_ptr<string>($1);
    unary_exp->func_rparams=unique_ptr<ExpVecAST>(new ExpVecAST());
    unary_exp->bnf_type=UnaryExpType::CALL;
    $$=unary_exp;
  }
  | IDENT '(' FuncRParams ')' {
    auto unary_exp=new UnaryExpAST();
    unary_exp->func_name=*unique_ptr<string>($1);
    unary_exp->func_rparams=unique_ptr<ExpVecAST>($3);
    unary_exp->bnf_type=UnaryExpType::CALL;
    $$=unary_exp;
  }
  ;

FuncRParams
  : FuncRParams ',' Exp {
    auto params=($1);
    auto exp=unique_ptr<BaseExpAST>($3);
    params->push_back(exp);
    $$=params;
  }
  | Exp {
    auto params=new ExpVecAST();
    auto exp=unique_ptr<BaseExpAST>($1);
    params->push_back(exp);
    $$=params;
  }
  ;

MulExp
  : UnaryExp {
    auto mul_exp=new MulExpAST();
    mul_exp->bnf_type=BianryOPExpType::INHERIT;
    mul_exp->unary_exp=unique_ptr<BaseExpAST>($1);
    $$=mul_exp;
  }
  | MulExp MulOP UnaryExp {
    auto mul_exp=new MulExpAST();
    mul_exp->bnf_type=BianryOPExpType::EXPAND;
    mul_exp->mul_exp=unique_ptr<BaseExpAST>($1);
    mul_exp->op=*unique_ptr<string>($2);
    mul_exp->unary_exp=unique_ptr<BaseExpAST>($3);
    $$=mul_exp;
  }
  ;

AddExp
  : MulExp {
    auto add_exp=new AddExpAST();
    add_exp->bnf_type=BianryOPExpType::INHERIT;
    add_exp->mul_exp=unique_ptr<BaseExpAST>($1);
    $$=add_exp;
  }
  | AddExp AddOP MulExp {
    auto add_exp=new AddExpAST();
    add_exp->bnf_type=BianryOPExpType::EXPAND;
    add_exp->add_exp=unique_ptr<BaseExpAST>($1);
    add_exp->op=*unique_ptr<string>($2);
    add_exp->mul_exp=unique_ptr<BaseExpAST>($3);
    $$=add_exp;
  }
  ;

RelExp
  : AddExp {
    auto rel_exp=new RelExpAST();
    rel_exp->bnf_type=BianryOPExpType::INHERIT;
    rel_exp->add_exp=unique_ptr<BaseExpAST>($1);
    $$=rel_exp;
  }
  | RelExp RelOP AddExp {
    auto rel_exp=new RelExpAST();
    rel_exp->bnf_type=BianryOPExpType::EXPAND;
    rel_exp->rel_exp=unique_ptr<BaseExpAST>($1);
    rel_exp->op=*unique_ptr<string>($2);
    rel_exp->add_exp=unique_ptr<BaseExpAST>($3);
    $$=rel_exp;
  }
  ;

EqExp
  : RelExp {
    auto eq_exp=new EqExpAST();
    eq_exp->bnf_type=BianryOPExpType::INHERIT;
    eq_exp->rel_exp=unique_ptr<BaseExpAST>($1);
    $$=eq_exp;
  }
  | EqExp EqOP RelExp {
    auto eq_exp=new EqExpAST();
    eq_exp->bnf_type=BianryOPExpType::EXPAND;
    eq_exp->eq_exp=unique_ptr<BaseExpAST>($1);
    eq_exp->op=*unique_ptr<string>($2);
    eq_exp->rel_exp=unique_ptr<BaseExpAST>($3);
    $$=eq_exp;
  }
  ;

LAndExp
  : EqExp {
    auto land_exp=new LAndExpAST();
    land_exp->bnf_type=BianryOPExpType::INHERIT;
    land_exp->eq_exp=unique_ptr<BaseExpAST>($1);
    $$=land_exp;
  }
  | LAndExp AND EqExp {
    auto land_exp=new LAndExpAST();
    land_exp->bnf_type=BianryOPExpType::EXPAND;
    land_exp->land_exp=unique_ptr<BaseExpAST>($1);
    land_exp->eq_exp=unique_ptr<BaseExpAST>($3);
    $$=land_exp;
  }
  ;

LOrExp
  : LAndExp {
    auto lor_exp=new LOrExpAST();
    lor_exp->bnf_type=BianryOPExpType::INHERIT;
    lor_exp->land_exp=unique_ptr<BaseExpAST>($1);
    $$=lor_exp;
  }
  | LOrExp OR LAndExp {
    auto lor_exp=new LOrExpAST();
    lor_exp->bnf_type=BianryOPExpType::EXPAND;
    lor_exp->lor_exp=unique_ptr<BaseExpAST>($1);
    lor_exp->land_exp=unique_ptr<BaseExpAST>($3);
    $$=lor_exp;
  }
  ;

UnaryOP
  : '+' {
      string *op = new string("+");
      $$ = op;
  }
  | '-' {
      string *op = new string("-");
      $$ = op;
  }
  | '!' {
      string *op = new string("!");
      $$ = op;
  }
  ;

MulOP
  : '*' {
      string *op = new string("*");
      $$ = op;
  }
  | '/' {
      string *op = new string("/");
      $$ = op;
  }
  | '%' {
      string *op = new string("%");
      $$ = op;
  }
  ;

AddOP
  : '+' {
      string *op = new string("+");
      $$ = op;
  }
  | '-' {
      string *op = new string("-");
      $$ = op;
  }
  ;

RelOP
  : '<' {
      string *op = new string("<");
      $$ = op;
  }
  | '>' {
      string *op = new string(">");
      $$ = op;
  }
  | LE {
      string *op = new string("<=");
      $$ = op;
  }
  | GE {
      string *op = new string(">=");
      $$ = op;
  }
  ;

EqOP
  : EQ {
      string *op = new string("==");
      $$ = op;
  }
  | NEQ {
      string *op = new string("!=");
      $$ = op;
  }
  ;


Number
  : INT_CONST {
    $$=($1);
  }
  ;

Decl
  : ConstDecl {
    auto decl=new DeclAST();
    decl->const_decl=unique_ptr<BaseAST>($1);
    decl->bnf_type=DeclType::CONST_DECL;
    $$=decl;
  }
  | VarDecl {
    auto decl=new DeclAST();
    decl->var_decl=unique_ptr<BaseAST>($1);
    decl->bnf_type=DeclType::VAR_DECL;
    $$=decl;
  }
  ;

ConstDecl
  : CONST Type ConstDefs ';' {
    auto const_decl=new ConstDeclAST();
    const_decl->btype=unique_ptr<BaseAST>($2);
    const_decl->const_defs=unique_ptr<VecAST>($3);
    $$=const_decl;
  }
  ;


ConstDefs
  : ConstDef {
    auto const_def=unique_ptr<BaseAST>($1);
    auto const_defs=new VecAST();
    const_defs->push_back(const_def);
    $$=const_defs;
  } 
  | ConstDefs ',' ConstDef {
    auto const_defs=$1;
    auto const_def=unique_ptr<BaseAST>($3);
    const_defs->push_back(const_def);
    $$=const_defs;
  }
  ;

ConstDef
  : IDENT '=' ConstInitVal {
    auto const_def=new ConstDefAST();
    const_def->ident=*unique_ptr<string>($1);
    const_def->const_init_val=unique_ptr<BaseExpAST>($3);
    const_def->bnf_type=InitType::INIT_VAR;
    $$=const_def;
  }
  | IDENT ConstExpArrs '=' ConstInitVal {
    auto const_def=new ConstDefAST();
    const_def->ident=*unique_ptr<string>($1);
    const_def->const_exps=unique_ptr<ExpVecAST>($2);
    const_def->const_init_val=unique_ptr<BaseExpAST>($4);
    const_def->bnf_type=InitType::INIT_ARRAY;
    $$=const_def;
  }
  ;

ConstExpArrs
  : '[' ConstExp ']'{
    auto const_exp=unique_ptr<BaseExpAST>($2);
    auto const_exps=new ExpVecAST();
    const_exps->push_back(const_exp);
    $$=const_exps;
  } 
  | ConstExpArrs '[' ConstExp ']' {
    auto const_exps=$1;
    auto const_exp=unique_ptr<BaseExpAST>($3);
    const_exps->push_back(const_exp);
    $$=const_exps;
  }
  ;

ConstInitVal
  : ConstExp {
    auto const_init_val=new ConstInitValAST();
    const_init_val->const_exp=unique_ptr<BaseExpAST>($1);
    const_init_val->bnf_type=InitType::INIT_VAR;
    $$=const_init_val;
  }
  | '{' '}' {
    auto const_init_val=new ConstInitValAST();
    const_init_val->const_init_vals=unique_ptr<ExpVecAST>(new ExpVecAST());
    const_init_val->bnf_type=InitType::INIT_ARRAY;
    $$=const_init_val;
  }
  | '{' ConstInitVals '}' {
    auto const_init_val=new ConstInitValAST();
    const_init_val->const_init_vals=unique_ptr<ExpVecAST>($2);
    const_init_val->bnf_type=InitType::INIT_ARRAY;
    $$=const_init_val;
  }
  ;

ConstInitVals
  : ConstInitVal {
    auto const_init_val=unique_ptr<BaseExpAST>($1);
    auto const_init_vals=new ExpVecAST();
    const_init_vals->push_back(const_init_val);
    $$=const_init_vals;
  } 
  | ConstInitVals ',' ConstInitVal {
    auto const_init_vals=$1;
    auto const_init_val=unique_ptr<BaseExpAST>($3);
    const_init_vals->push_back(const_init_val);
    $$=const_init_vals;
  }
  ;



ConstExp
  : Exp {
    auto const_exp=new ConstExpAST();
    const_exp->exp=unique_ptr<BaseExpAST>($1);
    $$=const_exp;
  }
  ;

LVal
  : IDENT {
    auto lval=new LValAST();
    lval->ident=*unique_ptr<string>($1);
    lval->bnf_type=LValType::LVAL_VAR;
    $$=lval;
  }
  | IDENT  ExpArrs {
    auto lval=new LValAST();
    lval->ident=*unique_ptr<string>($1);
    lval->exps=unique_ptr<ExpVecAST>($2);
    lval->bnf_type=LValType::LVAL_ARRAY;
    $$=lval;
  }
  ;

ExpArrs
  : '[' Exp ']'{
    auto exp=unique_ptr<BaseExpAST>($2);
    auto exps=new ExpVecAST();
    exps->push_back(exp);
    $$=exps;
  } 
  | ExpArrs '[' Exp ']' {
    auto exps=$1;
    auto exp=unique_ptr<BaseExpAST>($3);
    exps->push_back(exp);
    $$=exps;
  }
  ;


VarDecl
  : Type VarDefs ';' {
    auto var_decl=new VarDeclAST();
    var_decl->btype=unique_ptr<BaseAST>($1);
    var_decl->var_defs=unique_ptr<VecAST>($2);
    $$=var_decl;
  }
  ;

VarDefs
  : VarDef {
    auto var_def=unique_ptr<BaseAST>($1);
    auto var_defs=new VecAST();
    var_defs->push_back(var_def);
    $$=var_defs;
  }
  | VarDefs ',' VarDef {
    auto var_defs=$1;
    auto var_def=unique_ptr<BaseAST>($3);
    var_defs->push_back(var_def);
    $$=var_defs;
  }
  ;

VarDef
  : IDENT {
    auto var_def=new VarDefAST();
    var_def->bnf_type=VarDefType::VAR;
    var_def->ident=*unique_ptr<string>($1);
    $$=var_def;

  }
  | IDENT '=' InitVal {
    auto var_def=new VarDefAST();
    var_def->bnf_type=VarDefType::VAR_ASSIGN_VAR;
    var_def->ident=*unique_ptr<string>($1);
    var_def->init_val=unique_ptr<BaseExpAST>($3);
    $$=var_def;
  }
  | IDENT  ConstExpArrs  {
    auto var_def=new VarDefAST();
    var_def->bnf_type=VarDefType::VAR_ARRAY;
    var_def->ident=*unique_ptr<string>($1);
    var_def->const_exps=unique_ptr<ExpVecAST>($2);
    $$=var_def;
  }
  | IDENT  ConstExpArrs '=' InitVal{
    auto var_def=new VarDefAST();
    var_def->bnf_type=VarDefType::VAR_ASSIGN_ARRAY;
    var_def->ident=*unique_ptr<string>($1);
    var_def->const_exps=unique_ptr<ExpVecAST>($2);
    var_def->init_val=unique_ptr<BaseExpAST>($4);
    $$=var_def;
  }
  ;

InitVal
  : Exp {
    auto init_val=new InitValAST();
    init_val->exp=unique_ptr<BaseExpAST>($1);
    init_val->bnf_type=InitType::INIT_VAR;
    $$=init_val;
  }
  | '{' InitVals '}' {
    auto init_val=new InitValAST();
    init_val->init_vals=unique_ptr<ExpVecAST>($2);
    init_val->bnf_type=InitType::INIT_ARRAY;
    $$=init_val;
  }
  | '{' '}' {
    auto init_val=new InitValAST();
    init_val->init_vals=unique_ptr<ExpVecAST>(new ExpVecAST());
    init_val->bnf_type=InitType::INIT_ARRAY;
    $$=init_val;
  }
  ;

InitVals
  : InitVal {
    auto init_val=unique_ptr<BaseExpAST>($1);
    auto init_vals=new ExpVecAST();
    init_vals->push_back(init_val);
    $$=init_vals;
  } 
  | InitVals ',' InitVal {
    auto init_vals=$1;
    auto init_val=unique_ptr<BaseExpAST>($3);
    init_vals->push_back(init_val);
    $$=init_vals;
  }
  ;



OpenStmt
  : IF '(' Exp ')' ClosedStmt {
    auto open_stmt=new OpenStmtAST();
    open_stmt->bnf_type=OpenStmtType::OSTMT_CLOSED;
    open_stmt->exp=unique_ptr<BaseExpAST>($3);
    open_stmt->closed_stmt=unique_ptr<BaseAST>($5);
    $$=open_stmt;
  }
  | IF '(' Exp ')' OpenStmt {
    auto open_stmt=new OpenStmtAST();
    open_stmt->bnf_type=OpenStmtType::OSTMT_OPEN;
    open_stmt->exp=unique_ptr<BaseExpAST>($3);
    open_stmt->open_stmt=unique_ptr<BaseAST>($5);
    $$=open_stmt;
  }
  | IF '(' Exp ')' ClosedStmt ELSE OpenStmt{
    auto open_stmt=new OpenStmtAST();
    open_stmt->bnf_type=OpenStmtType::OSTMT_ELSE;
    open_stmt->exp=unique_ptr<BaseExpAST>($3);
    open_stmt->closed_stmt=unique_ptr<BaseAST>($5);
    open_stmt->open_stmt=unique_ptr<BaseAST>($7);
    $$=open_stmt;
  }
  | WHILE '(' Exp ')' OpenStmt {
    auto open_stmt=new OpenStmtAST();
    open_stmt->bnf_type=OpenStmtType::OSTMT_WHILE;
    open_stmt->exp=unique_ptr<BaseExpAST>($3);
    open_stmt->open_stmt=unique_ptr<BaseAST>($5);
    $$=open_stmt;
  }
  ;

ClosedStmt
  : SimpleStmt {
    auto closed_stmt=new ClosedStmtAST();
    closed_stmt->bnf_type=ClosedStmtType::CSTMT_SIMPLE;
    closed_stmt->simple_stmt=unique_ptr<BaseAST>($1);
    $$=closed_stmt;
  }
  | IF '(' Exp ')' ClosedStmt ELSE ClosedStmt {
    auto closed_stmt=new ClosedStmtAST();
    closed_stmt->bnf_type=ClosedStmtType::CSTMT_ELSE;
    closed_stmt->exp=unique_ptr<BaseExpAST>($3);
    closed_stmt->closed_stmt1=unique_ptr<BaseAST>($5);
    closed_stmt->closed_stmt2=unique_ptr<BaseAST>($7);
    $$=closed_stmt;
  }
  | WHILE '(' Exp ')' ClosedStmt {
    auto closed_stmt=new ClosedStmtAST();
    closed_stmt->bnf_type=ClosedStmtType::CSTMT_WHILE;
    closed_stmt->exp=unique_ptr<BaseExpAST>($3);
    closed_stmt->closed_stmt1=unique_ptr<BaseAST>($5);
    $$=closed_stmt;
  }
  ;

%%

// 定义错误处理函数, 其中第二个参数是错误信息
// parser 如果发生错误 (例如输入的程序出现了语法错误), 就会调用这个函数
void yyerror(unique_ptr<BaseAST> &ast, const char *s) {
  cerr << "error: " << s << endl;
}
