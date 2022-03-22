#ifndef PARSER_HEADER_FILE
#define PARSER_HEADER_FILE

#include<vector>
#include<string>


class Program;
class ListExpr;
class Expr;
typedef union
{
  int    _int;
  char   _char;
  double _double;
  char*  _string;
  Program* program_;
  ListExpr* listexpr_;
  Expr* expr_;
} YYSTYPE;

Program* pProgram(FILE *inp);
Program* pProgram(const char *str);
ListExpr* pListExpr(FILE *inp);
ListExpr* pListExpr(const char *str);
Expr* pExpr(FILE *inp);
Expr* pExpr(const char *str);


#define _ERROR_ 258
#define _SYMB_2 259
#define _SYMB_3 260
#define _SYMB_1 261
#define _SYMB_0 262
#define _SYMB_6 263
#define _SYMB_7 264
#define _SYMB_8 265
#define _SYMB_9 266
#define _SYMB_10 267
#define _SYMB_11 268
#define _SYMB_12 269
#define _SYMB_13 270
#define _SYMB_14 271
#define _SYMB_15 272
#define _SYMB_4 273
#define _SYMB_5 274
#define _IDENT_ 275

extern YYSTYPE yylval;

#endif
