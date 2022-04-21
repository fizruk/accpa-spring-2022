/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_NAMELESS_BISON_H_INCLUDED
# define YY_NAMELESS_BISON_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif
#if YYDEBUG
extern int Namelessdebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    _ERROR_ = 258,
    _LPAREN = 259,
    _RPAREN = 260,
    _COMMA = 261,
    _RARROW = 262,
    _DOT = 263,
    _SYMB_8 = 264,
    _COLON = 265,
    _SEMI = 266,
    _EQ = 267,
    _KW_Bool = 268,
    _KW_Nat = 269,
    _KW_else = 270,
    _KW_false = 271,
    _KW_fun = 272,
    _KW_if = 273,
    _KW_in = 274,
    _KW_iszero = 275,
    _KW_let = 276,
    _KW_pred = 277,
    _KW_return = 278,
    _KW_succ = 279,
    _KW_then = 280,
    _KW_true = 281,
    _LBRACE = 282,
    _RBRACE = 283,
    _INTEGER_ = 284,
    _IDENT_ = 285
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 52 "Nameless.y" /* yacc.c:1909  */

  int    _int;
  char   _char;
  double _double;
  char*  _string;
  Nameless::Program* program_;
  Nameless::ListExpr* listexpr_;
  Nameless::Expr* expr_;
  Nameless::BindingExpr* bindingexpr_;
  Nameless::ListBindingExpr* listbindingexpr_;
  Nameless::Type* type_;
  Nameless::FieldTypeExpr* fieldtypeexpr_;
  Nameless::ListFieldTypeExpr* listfieldtypeexpr_;
  Nameless::Typing* typing_;

#line 101 "Bison.H" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif

/* Location type.  */
#if ! defined YYLTYPE && ! defined YYLTYPE_IS_DECLARED
typedef struct YYLTYPE YYLTYPE;
struct YYLTYPE
{
  int first_line;
  int first_column;
  int last_line;
  int last_column;
};
# define YYLTYPE_IS_DECLARED 1
# define YYLTYPE_IS_TRIVIAL 1
#endif



int Namelessparse (yyscan_t scanner, YYSTYPE *result);

#endif /* !YY_NAMELESS_BISON_H_INCLUDED  */
