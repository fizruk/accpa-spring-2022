-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module Syntax.Nameless.Par
  ( happyError
  , myLexer
  , pProgram
  , pListExpr
  , pExpr
  , pBinding
  , pListBinding
  , pExpr1
  , pExpr2
  , pExpr3
  , pType
  , pType1
  , pFieldType
  , pListFieldType
  , pTyping
  ) where

import Prelude

import qualified Syntax.Nameless.Abs
import Syntax.Nameless.Lex

}

%name pProgram Program
%name pListExpr ListExpr
%name pExpr Expr
%name pBinding Binding
%name pListBinding ListBinding
%name pExpr1 Expr1
%name pExpr2 Expr2
%name pExpr3 Expr3
%name pType Type
%name pType1 Type1
%name pFieldType FieldType
%name pListFieldType ListFieldType
%name pTyping Typing
-- no lexer declaration
%monad { Err } { (>>=) } { return }
%tokentype {Token}
%token
  '(' { PT _ (TS _ 1) }
  ')' { PT _ (TS _ 2) }
  ',' { PT _ (TS _ 3) }
  '->' { PT _ (TS _ 4) }
  '.' { PT _ (TS _ 5) }
  '0' { PT _ (TS _ 6) }
  ':' { PT _ (TS _ 7) }
  ';' { PT _ (TS _ 8) }
  '=' { PT _ (TS _ 9) }
  'Bool' { PT _ (TS _ 10) }
  'Nat' { PT _ (TS _ 11) }
  'else' { PT _ (TS _ 12) }
  'false' { PT _ (TS _ 13) }
  'fun' { PT _ (TS _ 14) }
  'if' { PT _ (TS _ 15) }
  'in' { PT _ (TS _ 16) }
  'iszero' { PT _ (TS _ 17) }
  'let' { PT _ (TS _ 18) }
  'pred' { PT _ (TS _ 19) }
  'return' { PT _ (TS _ 20) }
  'succ' { PT _ (TS _ 21) }
  'then' { PT _ (TS _ 22) }
  'true' { PT _ (TS _ 23) }
  '{' { PT _ (TS _ 24) }
  '}' { PT _ (TS _ 25) }
  L_Ident  { PT _ (TV $$) }
  L_integ  { PT _ (TI $$) }

%%

Ident :: { Syntax.Nameless.Abs.Ident }
Ident  : L_Ident { Syntax.Nameless.Abs.Ident $1 }

Integer :: { Integer }
Integer  : L_integ  { (read $1) :: Integer }

Program :: { Syntax.Nameless.Abs.Program }
Program : ListExpr { Syntax.Nameless.Abs.ProgramExprs $1 }

ListExpr :: { [Syntax.Nameless.Abs.Expr] }
ListExpr : {- empty -} { [] }
         | Expr { (:[]) $1 }
         | Expr ';' ListExpr { (:) $1 $3 }

Expr :: { Syntax.Nameless.Abs.Expr }
Expr : 'if' Expr 'then' Expr 'else' Expr { Syntax.Nameless.Abs.If $2 $4 $6 }
     | 'let' Expr 'in' Expr { Syntax.Nameless.Abs.Let $2 $4 }
     | 'fun' '(' Type ')' '{' 'return' Expr '}' { Syntax.Nameless.Abs.Abstraction $3 $7 }
     | '{' ListBinding '}' { Syntax.Nameless.Abs.Record $2 }
     | Expr1 { $1 }

Binding :: { Syntax.Nameless.Abs.Binding }
Binding : Ident '=' Expr { Syntax.Nameless.Abs.Binding $1 $3 }

ListBinding :: { [Syntax.Nameless.Abs.Binding] }
ListBinding : {- empty -} { [] }
            | Binding { (:[]) $1 }
            | Binding ',' ListBinding { (:) $1 $3 }

Expr1 :: { Syntax.Nameless.Abs.Expr }
Expr1 : Expr1 Expr2 { Syntax.Nameless.Abs.Application $1 $2 }
      | Expr2 { $1 }

Expr2 :: { Syntax.Nameless.Abs.Expr }
Expr2 : 'succ' Expr3 { Syntax.Nameless.Abs.Succ $2 }
      | Expr3 '.' Ident { Syntax.Nameless.Abs.Dot $1 $3 }
      | 'pred' Expr3 { Syntax.Nameless.Abs.Pred $2 }
      | 'iszero' Expr3 { Syntax.Nameless.Abs.IsZero $2 }
      | Expr3 { $1 }

Expr3 :: { Syntax.Nameless.Abs.Expr }
Expr3 : 'true' { Syntax.Nameless.Abs.ConstTrue }
      | 'false' { Syntax.Nameless.Abs.ConstFalse }
      | '0' { Syntax.Nameless.Abs.ConstZero }
      | Ident { Syntax.Nameless.Abs.FreeVar $1 }
      | Integer { Syntax.Nameless.Abs.BoundVar $1 }
      | '(' Expr ')' { $2 }

Type :: { Syntax.Nameless.Abs.Type }
Type : Type1 '->' Type { Syntax.Nameless.Abs.FunType $1 $3 }
     | '{' ListFieldType '}' { Syntax.Nameless.Abs.RecordType $2 }
     | Type1 { $1 }

Type1 :: { Syntax.Nameless.Abs.Type }
Type1 : 'Bool' { Syntax.Nameless.Abs.BoolType }
      | 'Nat' { Syntax.Nameless.Abs.NatType }
      | '(' Type ')' { $2 }

FieldType :: { Syntax.Nameless.Abs.FieldType }
FieldType : Ident ':' Type { Syntax.Nameless.Abs.FieldType $1 $3 }

ListFieldType :: { [Syntax.Nameless.Abs.FieldType] }
ListFieldType : {- empty -} { [] }
              | FieldType { (:[]) $1 }
              | FieldType ',' ListFieldType { (:) $1 $3 }

Typing :: { Syntax.Nameless.Abs.Typing }
Typing : Expr ':' Type { Syntax.Nameless.Abs.Typing $1 $3 }
{

type Err = Either String

happyError :: [Token] -> Err a
happyError ts = Left $
  "syntax error at " ++ tokenPos ts ++
  case ts of
    []      -> []
    [Err _] -> " due to lexer error"
    t:_     -> " before `" ++ (prToken t) ++ "'"

myLexer :: String -> [Token]
myLexer = tokens

}

