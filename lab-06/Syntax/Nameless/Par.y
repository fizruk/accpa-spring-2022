-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module Syntax.Nameless.Par
  ( happyError
  , myLexer
  , pProgram
  , pExpr
  , pExpr0
  , pListExpr0
  , pExpr1
  , pExpr2
  , pExpr3
  , pStore
  , pAssignment
  , pListAssignment
  , pStoreTyping
  , pLocationTyping
  , pListLocationTyping
  , pType
  , pType1
  , pType2
  , pTyping
  ) where

import Prelude

import qualified Syntax.Nameless.Abs
import Syntax.Nameless.Lex

}

%name pProgram Program
%name pExpr Expr
%name pExpr0 Expr0
%name pListExpr0 ListExpr0
%name pExpr1 Expr1
%name pExpr2 Expr2
%name pExpr3 Expr3
%name pStore Store
%name pAssignment Assignment
%name pListAssignment ListAssignment
%name pStoreTyping StoreTyping
%name pLocationTyping LocationTyping
%name pListLocationTyping ListLocationTyping
%name pType Type
%name pType1 Type1
%name pType2 Type2
%name pTyping Typing
-- no lexer declaration
%monad { Err } { (>>=) } { return }
%tokentype {Token}
%token
  '!' { PT _ (TS _ 1) }
  '#' { PT _ (TS _ 2) }
  '(' { PT _ (TS _ 3) }
  ')' { PT _ (TS _ 4) }
  '->' { PT _ (TS _ 5) }
  '0' { PT _ (TS _ 6) }
  ':' { PT _ (TS _ 7) }
  ':=' { PT _ (TS _ 8) }
  ';' { PT _ (TS _ 9) }
  '=' { PT _ (TS _ 10) }
  'Bool' { PT _ (TS _ 11) }
  'Nat' { PT _ (TS _ 12) }
  'Ref' { PT _ (TS _ 13) }
  'Unit' { PT _ (TS _ 14) }
  'else' { PT _ (TS _ 15) }
  'false' { PT _ (TS _ 16) }
  'fun' { PT _ (TS _ 17) }
  'if' { PT _ (TS _ 18) }
  'iszero' { PT _ (TS _ 19) }
  'pred' { PT _ (TS _ 20) }
  'ref' { PT _ (TS _ 21) }
  'return' { PT _ (TS _ 22) }
  'succ' { PT _ (TS _ 23) }
  'then' { PT _ (TS _ 24) }
  'true' { PT _ (TS _ 25) }
  'unit' { PT _ (TS _ 26) }
  '{' { PT _ (TS _ 27) }
  '}' { PT _ (TS _ 28) }
  L_Ident  { PT _ (TV $$) }
  L_integ  { PT _ (TI $$) }

%%

Ident :: { Syntax.Nameless.Abs.Ident }
Ident  : L_Ident { Syntax.Nameless.Abs.Ident $1 }

Integer :: { Integer }
Integer  : L_integ  { (read $1) :: Integer }

Program :: { Syntax.Nameless.Abs.Program }
Program : Expr { Syntax.Nameless.Abs.ProgramExprs $1 }

Expr :: { Syntax.Nameless.Abs.Expr }
Expr : ListExpr0 { Syntax.Nameless.Abs.Seq $1 } | Expr0 { $1 }

Expr0 :: { Syntax.Nameless.Abs.Expr }
Expr0 : 'if' Expr0 'then' Expr0 'else' Expr0 { Syntax.Nameless.Abs.If $2 $4 $6 }
      | 'fun' '(' Type ')' '{' 'return' Expr0 '}' { Syntax.Nameless.Abs.Abstraction $3 $7 }
      | Expr1 ':=' Expr0 { Syntax.Nameless.Abs.Assign $1 $3 }
      | Expr1 { $1 }

ListExpr0 :: { [Syntax.Nameless.Abs.Expr] }
ListExpr0 : {- empty -} { [] }
          | Expr0 { (:[]) $1 }
          | Expr0 ';' ListExpr0 { (:) $1 $3 }

Expr1 :: { Syntax.Nameless.Abs.Expr }
Expr1 : Expr1 Expr2 { Syntax.Nameless.Abs.Application $1 $2 }
      | Expr2 { $1 }

Expr2 :: { Syntax.Nameless.Abs.Expr }
Expr2 : 'ref' Expr3 { Syntax.Nameless.Abs.NewRef $2 }
      | '!' Expr3 { Syntax.Nameless.Abs.DeRef $2 }
      | 'succ' Expr3 { Syntax.Nameless.Abs.Succ $2 }
      | 'pred' Expr3 { Syntax.Nameless.Abs.Pred $2 }
      | 'iszero' Expr3 { Syntax.Nameless.Abs.IsZero $2 }
      | Expr3 { $1 }

Expr3 :: { Syntax.Nameless.Abs.Expr }
Expr3 : 'unit' { Syntax.Nameless.Abs.ConstUnit }
      | 'true' { Syntax.Nameless.Abs.ConstTrue }
      | 'false' { Syntax.Nameless.Abs.ConstFalse }
      | '0' { Syntax.Nameless.Abs.ConstZero }
      | Ident { Syntax.Nameless.Abs.FreeVar $1 }
      | Integer { Syntax.Nameless.Abs.BoundVar $1 }
      | '#' Integer { Syntax.Nameless.Abs.Location $2 }
      | '(' Expr ')' { $2 }

Store :: { Syntax.Nameless.Abs.Store }
Store : '{' ListAssignment '}' { Syntax.Nameless.Abs.Store $2 }

Assignment :: { Syntax.Nameless.Abs.Assignment }
Assignment : '#' Integer '=' Expr { Syntax.Nameless.Abs.Assignment $2 $4 }

ListAssignment :: { [Syntax.Nameless.Abs.Assignment] }
ListAssignment : {- empty -} { [] }
               | Assignment { (:[]) $1 }
               | Assignment ';' ListAssignment { (:) $1 $3 }

StoreTyping :: { Syntax.Nameless.Abs.StoreTyping }
StoreTyping : '{' ListLocationTyping '}' { Syntax.Nameless.Abs.StoreTyping $2 }

LocationTyping :: { Syntax.Nameless.Abs.LocationTyping }
LocationTyping : '#' Integer ':' Type { Syntax.Nameless.Abs.LocationTyping $2 $4 }

ListLocationTyping :: { [Syntax.Nameless.Abs.LocationTyping] }
ListLocationTyping : {- empty -} { [] }
                   | LocationTyping { (:[]) $1 }
                   | LocationTyping ';' ListLocationTyping { (:) $1 $3 }

Type :: { Syntax.Nameless.Abs.Type }
Type : Type1 '->' Type { Syntax.Nameless.Abs.FunType $1 $3 }
     | Type1 { $1 }

Type1 :: { Syntax.Nameless.Abs.Type }
Type1 : 'Ref' Type2 { Syntax.Nameless.Abs.RefType $2 }
      | Type2 { $1 }

Type2 :: { Syntax.Nameless.Abs.Type }
Type2 : 'Bool' { Syntax.Nameless.Abs.BoolType }
      | 'Nat' { Syntax.Nameless.Abs.NatType }
      | 'Unit' { Syntax.Nameless.Abs.UnitType }
      | '(' Type ')' { $2 }

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

