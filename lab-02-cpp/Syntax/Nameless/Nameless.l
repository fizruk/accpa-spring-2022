/* -*- c++ -*- File generated by the BNF Converter (bnfc 2.9.4). */

/* Lexer definition for use with FLex */

%option noyywrap noinput nounput
%option reentrant bison-bridge bison-locations

%option prefix="Nameless"
%{
#include "Absyn.H"
#include "Bison.H"

#define initialize_lexer Nameless_initialize_lexer

static void update_loc(YYLTYPE* loc, char* text)
{
  loc->first_line = loc->last_line;
  loc->first_column = loc->last_column;
  int i = 0;
  for (; text[i] != '\0'; ++i) {
      if (text[i] == '\n') {
          ++loc->last_line;
          loc->last_column = 0;
      } else {
          ++loc->last_column;
      }
  }
}
#define YY_USER_ACTION update_loc(yylloc, yytext);

%}

LETTER [a-zA-Z]
CAPITAL [A-Z]
SMALL [a-z]
DIGIT [0-9]
IDENT [a-zA-Z0-9'_]
%START CHAR CHARESC CHAREND STRING ESCAPED COMMENT

%%  /* Rules. */

<INITIAL>";"      	 return _SEMI;
<INITIAL>"0"      	 return _SYMB_1;
<INITIAL>"("      	 return _LPAREN;
<INITIAL>")"      	 return _RPAREN;
<INITIAL>"{"      	 return _LBRACE;
<INITIAL>"}"      	 return _RBRACE;
<INITIAL>"->"      	 return _RARROW;
<INITIAL>":"      	 return _COLON;
<INITIAL>"Bool"      	 return _KW_Bool;
<INITIAL>"Nat"      	 return _KW_Nat;
<INITIAL>"else"      	 return _KW_else;
<INITIAL>"false"      	 return _KW_false;
<INITIAL>"fun"      	 return _KW_fun;
<INITIAL>"if"      	 return _KW_if;
<INITIAL>"iszero"      	 return _KW_iszero;
<INITIAL>"pred"      	 return _KW_pred;
<INITIAL>"return"      	 return _KW_return;
<INITIAL>"succ"      	 return _KW_succ;
<INITIAL>"then"      	 return _KW_then;
<INITIAL>"true"      	 return _KW_true;

<INITIAL>"//"[^\n]* /* skip */; /* BNFC: comment "//" */
<INITIAL>"/*" BEGIN COMMENT;
<COMMENT>"*/" BEGIN INITIAL;
<COMMENT>.    /* skip */;
<COMMENT>[\n] /* skip */;

<INITIAL>{DIGIT}+      	 yylval->_int = atoi(yytext); return _INTEGER_;
<INITIAL>{LETTER}{IDENT}*      	 yylval->_string = strdup(yytext); return _IDENT_;
<INITIAL>[ \t\r\n\f]      	 /* ignore white space. */;
<INITIAL>.      	 return _ERROR_;

%%  /* Initialization code. */

yyscan_t initialize_lexer(FILE *inp)
{
  yyscan_t scanner;
  if (yylex_init_extra(NULL, &scanner)) return 0;
  if (inp) yyrestart(inp, scanner);
  return scanner;
}
