/* -*- c++ -*- File generated by the BNF Converter (bnfc 2.9.4). */

/* Parser definition to be used with Bison. */

/* Generate header file for lexer. */
%defines "Bison.H"
%name-prefix = "Normal"
  /* From Bison 2.6: %define api.prefix {Normal} */

/* Reentrant parser */
%pure_parser
  /* From Bison 2.3b (2008): %define api.pure full */
%lex-param   { yyscan_t scanner }
%parse-param { yyscan_t scanner }

/* Turn on line/column tracking in the Normallloc structure: */
%locations

/* Argument to the parser to be filled with the parsed tree. */
%parse-param { YYSTYPE *result }

%{
/* Begin C preamble code */

#include <algorithm> /* for std::reverse */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "Absyn.H"

#define YYMAXDEPTH 10000000

/* The type yyscan_t is defined by flex, but we need it in the parser already. */
#ifndef YY_TYPEDEF_YY_SCANNER_T
#define YY_TYPEDEF_YY_SCANNER_T
typedef void* yyscan_t;
#endif

typedef struct yy_buffer_state *YY_BUFFER_STATE;
extern YY_BUFFER_STATE Normal_scan_string(const char *str, yyscan_t scanner);
extern void Normal_delete_buffer(YY_BUFFER_STATE buf, yyscan_t scanner);

extern void Normallex_destroy(yyscan_t scanner);
extern char* Normalget_text(yyscan_t scanner);

extern yyscan_t Normal_initialize_lexer(FILE * inp);

/* End C preamble code */
%}

%union
{
  int    _int;
  char   _char;
  double _double;
  char*  _string;
  Normal::Program* program_;
  Normal::ListExpr* listexpr_;
  Normal::Expr* expr_;
  Normal::BindingExpr* bindingexpr_;
  Normal::ListBindingExpr* listbindingexpr_;
  Normal::Type* type_;
  Normal::FieldTypeExpr* fieldtypeexpr_;
  Normal::ListFieldTypeExpr* listfieldtypeexpr_;
  Normal::Typing* typing_;
}

%{
void yyerror(YYLTYPE *loc, yyscan_t scanner, YYSTYPE *result, const char *msg)
{
  fprintf(stderr, "error: %d,%d: %s at %s\n",
    loc->first_line, loc->first_column, msg, Normalget_text(scanner));
}

int yyparse(yyscan_t scanner, YYSTYPE *result);

extern int yylex(YYSTYPE *lvalp, YYLTYPE *llocp, yyscan_t scanner);
%}

%token          _ERROR_
%token          _LPAREN     /* ( */
%token          _RPAREN     /* ) */
%token          _COMMA      /* , */
%token          _RARROW     /* -> */
%token          _DOT        /* . */
%token          _SYMB_9     /* 0 */
%token          _COLON      /* : */
%token          _SEMI       /* ; */
%token          _EQ         /* = */
%token          _KW_Bool    /* Bool */
%token          _KW_Nat     /* Nat */
%token          _KW_else    /* else */
%token          _KW_false   /* false */
%token          _KW_fun     /* fun */
%token          _KW_if      /* if */
%token          _KW_in      /* in */
%token          _KW_iszero  /* iszero */
%token          _KW_let     /* let */
%token          _KW_pred    /* pred */
%token          _KW_return  /* return */
%token          _KW_succ    /* succ */
%token          _KW_then    /* then */
%token          _KW_true    /* true */
%token          _LBRACE     /* { */
%token          _RBRACE     /* } */
%token<_string> _IDENT_

%type <program_> Program
%type <listexpr_> ListExpr
%type <expr_> Expr
%type <bindingexpr_> BindingExpr
%type <listbindingexpr_> ListBindingExpr
%type <expr_> Expr1
%type <expr_> Expr2
%type <expr_> Expr3
%type <type_> Type
%type <type_> Type1
%type <fieldtypeexpr_> FieldTypeExpr
%type <listfieldtypeexpr_> ListFieldTypeExpr
%type <typing_> Typing

%start Program

%%

Program : ListExpr { std::reverse($1->begin(),$1->end()) ;$$ = new Normal::ProgramExprs($1); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->program_ = $$; }
;
ListExpr : /* empty */ { $$ = new Normal::ListExpr(); result->listexpr_ = $$; }
  | Expr { $$ = new Normal::ListExpr(); $$->push_back($1); result->listexpr_ = $$; }
  | Expr _SEMI ListExpr { $3->push_back($1); $$ = $3; result->listexpr_ = $$; }
;
Expr : _KW_if Expr _KW_then Expr _KW_else Expr { $$ = new Normal::If($2, $4, $6); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
  | _KW_let _IDENT_ _EQ Expr _KW_in Expr { $$ = new Normal::Let($2, $4, $6); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
  | _KW_fun _LPAREN _IDENT_ _COLON Type _RPAREN _LBRACE _KW_return Expr _RBRACE { $$ = new Normal::Abstraction($3, $5, $9); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
  | _LBRACE ListBindingExpr _RBRACE { std::reverse($2->begin(),$2->end()) ;$$ = new Normal::Record($2); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
  | Expr1 { $$ = $1; $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
;
BindingExpr : _IDENT_ _EQ Expr { $$ = new Normal::Binding($1, $3); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->bindingexpr_ = $$; }
;
ListBindingExpr : /* empty */ { $$ = new Normal::ListBindingExpr(); result->listbindingexpr_ = $$; }
  | BindingExpr { $$ = new Normal::ListBindingExpr(); $$->push_back($1); result->listbindingexpr_ = $$; }
  | BindingExpr _COMMA ListBindingExpr { $3->push_back($1); $$ = $3; result->listbindingexpr_ = $$; }
;
Expr1 : Expr1 Expr2 { $$ = new Normal::Application($1, $2); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
  | Expr2 { $$ = $1; $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
;
Expr2 : _KW_succ Expr3 { $$ = new Normal::Succ($2); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
  | _KW_pred Expr3 { $$ = new Normal::Pred($2); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
  | _KW_iszero Expr3 { $$ = new Normal::IsZero($2); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
  | Expr3 { $$ = $1; $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
;
Expr3 : Expr3 _DOT _IDENT_ { $$ = new Normal::Dot($1, $3); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
  | _KW_true { $$ = new Normal::ConstTrue(); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
  | _KW_false { $$ = new Normal::ConstFalse(); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
  | _SYMB_9 { $$ = new Normal::ConstZero(); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
  | _IDENT_ { $$ = new Normal::Var($1); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
  | _LPAREN Expr _RPAREN { $$ = $2; $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->expr_ = $$; }
;
Type : Type1 _RARROW Type { $$ = new Normal::FunType($1, $3); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->type_ = $$; }
  | _LBRACE ListFieldTypeExpr _RBRACE { std::reverse($2->begin(),$2->end()) ;$$ = new Normal::RecordType($2); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->type_ = $$; }
  | Type1 { $$ = $1; $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->type_ = $$; }
;
Type1 : _KW_Bool { $$ = new Normal::BoolType(); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->type_ = $$; }
  | _KW_Nat { $$ = new Normal::NatType(); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->type_ = $$; }
  | _LPAREN Type _RPAREN { $$ = $2; $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->type_ = $$; }
;
FieldTypeExpr : _IDENT_ _COLON Type { $$ = new Normal::FieldType($1, $3); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->fieldtypeexpr_ = $$; }
;
ListFieldTypeExpr : /* empty */ { $$ = new Normal::ListFieldTypeExpr(); result->listfieldtypeexpr_ = $$; }
  | FieldTypeExpr { $$ = new Normal::ListFieldTypeExpr(); $$->push_back($1); result->listfieldtypeexpr_ = $$; }
  | FieldTypeExpr _COMMA ListFieldTypeExpr { $3->push_back($1); $$ = $3; result->listfieldtypeexpr_ = $$; }
;
Typing : Expr _COLON Type { $$ = new Normal::TypingStmt($1, $3); $$->line_number = @$.first_line; $$->char_number = @$.first_column; result->typing_ = $$; }
;

%%

namespace Normal
{
/* Entrypoint: parse Program* from file. */
Program* pProgram(FILE *inp)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(inp);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  int error = yyparse(scanner, &result);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.program_;
  }
}

/* Entrypoint: parse Program* from string. */
Program* psProgram(const char *str)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(0);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  YY_BUFFER_STATE buf = Normal_scan_string(str, scanner);
  int error = yyparse(scanner, &result);
  Normal_delete_buffer(buf, scanner);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.program_;
  }
}

/* Entrypoint: parse ListExpr* from file. */
ListExpr* pListExpr(FILE *inp)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(inp);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  int error = yyparse(scanner, &result);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
std::reverse(result.listexpr_->begin(), result.listexpr_->end());
    return result.listexpr_;
  }
}

/* Entrypoint: parse ListExpr* from string. */
ListExpr* psListExpr(const char *str)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(0);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  YY_BUFFER_STATE buf = Normal_scan_string(str, scanner);
  int error = yyparse(scanner, &result);
  Normal_delete_buffer(buf, scanner);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
std::reverse(result.listexpr_->begin(), result.listexpr_->end());
    return result.listexpr_;
  }
}

/* Entrypoint: parse Expr* from file. */
Expr* pExpr(FILE *inp)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(inp);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  int error = yyparse(scanner, &result);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.expr_;
  }
}

/* Entrypoint: parse Expr* from string. */
Expr* psExpr(const char *str)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(0);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  YY_BUFFER_STATE buf = Normal_scan_string(str, scanner);
  int error = yyparse(scanner, &result);
  Normal_delete_buffer(buf, scanner);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.expr_;
  }
}

/* Entrypoint: parse BindingExpr* from file. */
BindingExpr* pBindingExpr(FILE *inp)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(inp);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  int error = yyparse(scanner, &result);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.bindingexpr_;
  }
}

/* Entrypoint: parse BindingExpr* from string. */
BindingExpr* psBindingExpr(const char *str)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(0);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  YY_BUFFER_STATE buf = Normal_scan_string(str, scanner);
  int error = yyparse(scanner, &result);
  Normal_delete_buffer(buf, scanner);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.bindingexpr_;
  }
}

/* Entrypoint: parse ListBindingExpr* from file. */
ListBindingExpr* pListBindingExpr(FILE *inp)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(inp);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  int error = yyparse(scanner, &result);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
std::reverse(result.listbindingexpr_->begin(), result.listbindingexpr_->end());
    return result.listbindingexpr_;
  }
}

/* Entrypoint: parse ListBindingExpr* from string. */
ListBindingExpr* psListBindingExpr(const char *str)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(0);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  YY_BUFFER_STATE buf = Normal_scan_string(str, scanner);
  int error = yyparse(scanner, &result);
  Normal_delete_buffer(buf, scanner);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
std::reverse(result.listbindingexpr_->begin(), result.listbindingexpr_->end());
    return result.listbindingexpr_;
  }
}

/* Entrypoint: parse Expr* from file. */
Expr* pExpr1(FILE *inp)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(inp);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  int error = yyparse(scanner, &result);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.expr_;
  }
}

/* Entrypoint: parse Expr* from string. */
Expr* psExpr1(const char *str)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(0);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  YY_BUFFER_STATE buf = Normal_scan_string(str, scanner);
  int error = yyparse(scanner, &result);
  Normal_delete_buffer(buf, scanner);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.expr_;
  }
}

/* Entrypoint: parse Expr* from file. */
Expr* pExpr2(FILE *inp)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(inp);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  int error = yyparse(scanner, &result);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.expr_;
  }
}

/* Entrypoint: parse Expr* from string. */
Expr* psExpr2(const char *str)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(0);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  YY_BUFFER_STATE buf = Normal_scan_string(str, scanner);
  int error = yyparse(scanner, &result);
  Normal_delete_buffer(buf, scanner);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.expr_;
  }
}

/* Entrypoint: parse Expr* from file. */
Expr* pExpr3(FILE *inp)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(inp);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  int error = yyparse(scanner, &result);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.expr_;
  }
}

/* Entrypoint: parse Expr* from string. */
Expr* psExpr3(const char *str)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(0);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  YY_BUFFER_STATE buf = Normal_scan_string(str, scanner);
  int error = yyparse(scanner, &result);
  Normal_delete_buffer(buf, scanner);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.expr_;
  }
}

/* Entrypoint: parse Type* from file. */
Type* pType(FILE *inp)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(inp);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  int error = yyparse(scanner, &result);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.type_;
  }
}

/* Entrypoint: parse Type* from string. */
Type* psType(const char *str)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(0);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  YY_BUFFER_STATE buf = Normal_scan_string(str, scanner);
  int error = yyparse(scanner, &result);
  Normal_delete_buffer(buf, scanner);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.type_;
  }
}

/* Entrypoint: parse Type* from file. */
Type* pType1(FILE *inp)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(inp);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  int error = yyparse(scanner, &result);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.type_;
  }
}

/* Entrypoint: parse Type* from string. */
Type* psType1(const char *str)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(0);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  YY_BUFFER_STATE buf = Normal_scan_string(str, scanner);
  int error = yyparse(scanner, &result);
  Normal_delete_buffer(buf, scanner);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.type_;
  }
}

/* Entrypoint: parse FieldTypeExpr* from file. */
FieldTypeExpr* pFieldTypeExpr(FILE *inp)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(inp);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  int error = yyparse(scanner, &result);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.fieldtypeexpr_;
  }
}

/* Entrypoint: parse FieldTypeExpr* from string. */
FieldTypeExpr* psFieldTypeExpr(const char *str)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(0);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  YY_BUFFER_STATE buf = Normal_scan_string(str, scanner);
  int error = yyparse(scanner, &result);
  Normal_delete_buffer(buf, scanner);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.fieldtypeexpr_;
  }
}

/* Entrypoint: parse ListFieldTypeExpr* from file. */
ListFieldTypeExpr* pListFieldTypeExpr(FILE *inp)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(inp);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  int error = yyparse(scanner, &result);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
std::reverse(result.listfieldtypeexpr_->begin(), result.listfieldtypeexpr_->end());
    return result.listfieldtypeexpr_;
  }
}

/* Entrypoint: parse ListFieldTypeExpr* from string. */
ListFieldTypeExpr* psListFieldTypeExpr(const char *str)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(0);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  YY_BUFFER_STATE buf = Normal_scan_string(str, scanner);
  int error = yyparse(scanner, &result);
  Normal_delete_buffer(buf, scanner);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
std::reverse(result.listfieldtypeexpr_->begin(), result.listfieldtypeexpr_->end());
    return result.listfieldtypeexpr_;
  }
}

/* Entrypoint: parse Typing* from file. */
Typing* pTyping(FILE *inp)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(inp);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  int error = yyparse(scanner, &result);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.typing_;
  }
}

/* Entrypoint: parse Typing* from string. */
Typing* psTyping(const char *str)
{
  YYSTYPE result;
  yyscan_t scanner = Normal_initialize_lexer(0);
  if (!scanner) {
    fprintf(stderr, "Failed to initialize lexer.\n");
    return 0;
  }
  YY_BUFFER_STATE buf = Normal_scan_string(str, scanner);
  int error = yyparse(scanner, &result);
  Normal_delete_buffer(buf, scanner);
  Normallex_destroy(scanner);
  if (error)
  { /* Failure */
    return 0;
  }
  else
  { /* Success */
    return result.typing_;
  }
}


}
