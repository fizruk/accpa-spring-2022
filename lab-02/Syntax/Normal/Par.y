-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module Syntax.Normal.Par
  ( happyError
  , myLexer
  , pProgram
  , pListExpr
  , pExpr
  , pExpr1
  , pExpr2
  , pType
  , pType1
  , pTyping
  ) where

import Prelude

import qualified Syntax.Normal.Abs
import Syntax.Normal.Lex

}

%name pProgram Program
%name pListExpr ListExpr
%name pExpr Expr
%name pExpr1 Expr1
%name pExpr2 Expr2
%name pType Type
%name pType1 Type1
%name pTyping Typing
-- no lexer declaration
%monad { Err } { (>>=) } { return }
%tokentype {Token}
%token
  '(' { PT _ (TS _ 1) }
  ')' { PT _ (TS _ 2) }
  '->' { PT _ (TS _ 3) }
  '0' { PT _ (TS _ 4) }
  ':' { PT _ (TS _ 5) }
  ';' { PT _ (TS _ 6) }
  'Bool' { PT _ (TS _ 7) }
  'Nat' { PT _ (TS _ 8) }
  'else' { PT _ (TS _ 9) }
  'false' { PT _ (TS _ 10) }
  'fun' { PT _ (TS _ 11) }
  'if' { PT _ (TS _ 12) }
  'iszero' { PT _ (TS _ 13) }
  'pred' { PT _ (TS _ 14) }
  'return' { PT _ (TS _ 15) }
  'succ' { PT _ (TS _ 16) }
  'then' { PT _ (TS _ 17) }
  'true' { PT _ (TS _ 18) }
  '{' { PT _ (TS _ 19) }
  '}' { PT _ (TS _ 20) }
  L_Ident  { PT _ (TV $$) }

%%

Ident :: { Syntax.Normal.Abs.Ident }
Ident  : L_Ident { Syntax.Normal.Abs.Ident $1 }

Program :: { Syntax.Normal.Abs.Program }
Program : ListExpr { Syntax.Normal.Abs.ProgramExprs $1 }

ListExpr :: { [Syntax.Normal.Abs.Expr] }
ListExpr : {- empty -} { [] }
         | Expr { (:[]) $1 }
         | Expr ';' ListExpr { (:) $1 $3 }

Expr :: { Syntax.Normal.Abs.Expr }
Expr : Expr Expr1 { Syntax.Normal.Abs.Application $1 $2 }
     | Expr1 { $1 }

Expr1 :: { Syntax.Normal.Abs.Expr }
Expr1 : 'if' Expr1 'then' Expr1 'else' Expr1 { Syntax.Normal.Abs.If $2 $4 $6 }
      | 'succ' Expr2 { Syntax.Normal.Abs.Succ $2 }
      | 'pred' Expr2 { Syntax.Normal.Abs.Pred $2 }
      | 'iszero' Expr2 { Syntax.Normal.Abs.IsZero $2 }
      | 'fun' '(' Ident ':' Type ')' '{' 'return' Expr '}' { Syntax.Normal.Abs.Abstraction $3 $5 $9 }
      | Expr2 { $1 }

Expr2 :: { Syntax.Normal.Abs.Expr }
Expr2 : 'true' { Syntax.Normal.Abs.ConstTrue }
      | 'false' { Syntax.Normal.Abs.ConstFalse }
      | '0' { Syntax.Normal.Abs.ConstZero }
      | Ident { Syntax.Normal.Abs.Var $1 }
      | '(' Expr ')' { $2 }

Type :: { Syntax.Normal.Abs.Type }
Type : Type1 '->' Type { Syntax.Normal.Abs.FunType $1 $3 }
     | Type1 { $1 }

Type1 :: { Syntax.Normal.Abs.Type }
Type1 : 'Bool' { Syntax.Normal.Abs.BoolType }
      | 'Nat' { Syntax.Normal.Abs.NatType }
      | '(' Type ')' { $2 }

Typing :: { Syntax.Normal.Abs.Typing }
Typing : Expr ':' Type { Syntax.Normal.Abs.Typing $1 $3 }
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

