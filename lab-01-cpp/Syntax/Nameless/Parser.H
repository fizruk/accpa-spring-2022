#ifndef PARSER_HEADER_FILE
#define PARSER_HEADER_FILE

#include<vector>
#include<string>


class Expr;
typedef union
{
  int    _int;
  char   _char;
  double _double;
  char*  _string;
  Expr* expr_;
} YYSTYPE;

Expr* pExpr(FILE *inp);
Expr* pExpr(const char *str);


#define _ERROR_ 258
#define _SYMB_5 259
#define _SYMB_6 260
#define _SYMB_0 261
#define _SYMB_1 262
#define _SYMB_2 263
#define _SYMB_7 264
#define _SYMB_8 265
#define _SYMB_9 266
#define _SYMB_10 267
#define _SYMB_11 268
#define _SYMB_12 269
#define _SYMB_13 270
#define _SYMB_14 271
#define _SYMB_15 272
#define _SYMB_16 273
#define _SYMB_3 274
#define _SYMB_4 275
#define _INTEGER_ 276
#define _IDENT_ 277

extern YYSTYPE yylval;

#endif
