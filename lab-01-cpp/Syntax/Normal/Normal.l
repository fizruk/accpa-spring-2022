/* This FLex file was machine-generated by the BNF converter */
%{
#include <string.h>
#include "Parser.H"
extern int yy_mylinenumber ;

%}

LETTER [a-zA-Z]
CAPITAL [A-Z]
SMALL [a-z]
DIGIT [0-9]
IDENT [a-zA-Z0-9'_]
%START YYINITIAL CHAR CHARESC CHAREND STRING ESCAPED COMMENT

%%  /* Rules. */

<YYINITIAL>";"      	 return _SYMB_0;
<YYINITIAL>"0"      	 return _SYMB_1;
<YYINITIAL>"("      	 return _SYMB_2;
<YYINITIAL>")"      	 return _SYMB_3;
<YYINITIAL>"{"      	 return _SYMB_4;
<YYINITIAL>"}"      	 return _SYMB_5;
<YYINITIAL>"else"      	 return _SYMB_6;
<YYINITIAL>"false"      	 return _SYMB_7;
<YYINITIAL>"fun"      	 return _SYMB_8;
<YYINITIAL>"if"      	 return _SYMB_9;
<YYINITIAL>"iszero"      	 return _SYMB_10;
<YYINITIAL>"pred"      	 return _SYMB_11;
<YYINITIAL>"return"      	 return _SYMB_12;
<YYINITIAL>"succ"      	 return _SYMB_13;
<YYINITIAL>"then"      	 return _SYMB_14;
<YYINITIAL>"true"      	 return _SYMB_15;

<YYINITIAL>"//"[^\n]* ; // BNFC: comment "//";
<YYINITIAL>"/*" BEGIN COMMENT; // BNFC: block comment "/*" "*/";
<COMMENT>"*/" BEGIN YYINITIAL;
<COMMENT>.    /* skip */;
<COMMENT>[\n] ++yy_mylinenumber;

<YYINITIAL>{LETTER}{IDENT}*      	 yylval._string = strdup(yytext); return _IDENT_;
\n  ++yy_mylinenumber ;
<YYINITIAL>[ \t\r\n\f]      	 /* ignore white space. */;
<YYINITIAL>.      	 return _ERROR_;
%%
void initialize_lexer(FILE *inp) { yyrestart(inp); BEGIN YYINITIAL; }
int yywrap(void) { return 1; }
