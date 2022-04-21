-- This Happy file was machine-generated by the BNF converter
{
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module Syntax.Normal.Par
  ( happyError
  , myLexer
  , pProgram
  , pListExpr
  , pExpr
  , pMatchCase
  , pListMatchCase
  , pBinding
  , pListBinding
  , pExpr1
  , pExpr2
  , pExpr3
  , pType
  , pType1
  , pType2
  , pFieldType
  , pListFieldType
  , pTyping
  ) where

import Prelude

import qualified Syntax.Normal.Abs
import Syntax.Normal.Lex

}

%name pProgram Program
%name pListExpr ListExpr
%name pExpr Expr
%name pMatchCase MatchCase
%name pListMatchCase ListMatchCase
%name pBinding Binding
%name pListBinding ListBinding
%name pExpr1 Expr1
%name pExpr2 Expr2
%name pExpr3 Expr3
%name pType Type
%name pType1 Type1
%name pType2 Type2
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
  '<' { PT _ (TS _ 9) }
  '=' { PT _ (TS _ 10) }
  '=>' { PT _ (TS _ 11) }
  '>' { PT _ (TS _ 12) }
  'Bool' { PT _ (TS _ 13) }
  'Nat' { PT _ (TS _ 14) }
  '[' { PT _ (TS _ 15) }
  ']' { PT _ (TS _ 16) }
  'as' { PT _ (TS _ 17) }
  'cons' { PT _ (TS _ 18) }
  'else' { PT _ (TS _ 19) }
  'false' { PT _ (TS _ 20) }
  'fix' { PT _ (TS _ 21) }
  'fold' { PT _ (TS _ 22) }
  'fun' { PT _ (TS _ 23) }
  'head' { PT _ (TS _ 24) }
  'if' { PT _ (TS _ 25) }
  'in' { PT _ (TS _ 26) }
  'isempty' { PT _ (TS _ 27) }
  'iszero' { PT _ (TS _ 28) }
  'let' { PT _ (TS _ 29) }
  'match' { PT _ (TS _ 30) }
  'pred' { PT _ (TS _ 31) }
  'return' { PT _ (TS _ 32) }
  'succ' { PT _ (TS _ 33) }
  'tail' { PT _ (TS _ 34) }
  'then' { PT _ (TS _ 35) }
  'true' { PT _ (TS _ 36) }
  'unfold' { PT _ (TS _ 37) }
  '{' { PT _ (TS _ 38) }
  '}' { PT _ (TS _ 39) }
  'µ' { PT _ (TS _ 40) }
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
Expr : 'if' Expr 'then' Expr 'else' Expr { Syntax.Normal.Abs.If $2 $4 $6 }
     | 'let' Ident '=' Expr 'in' Expr { Syntax.Normal.Abs.Let $2 $4 $6 }
     | 'fun' '(' Ident ':' Type ')' '{' 'return' Expr '}' { Syntax.Normal.Abs.Abstraction $3 $5 $9 }
     | '{' ListBinding '}' { Syntax.Normal.Abs.Record $2 }
     | '<' Ident '=' Expr '>' 'as' '<' ListFieldType '>' { Syntax.Normal.Abs.Variant $2 $4 $8 }
     | 'match' Expr1 '{' ListMatchCase '}' { Syntax.Normal.Abs.Match $2 $4 }
     | '[' ListExpr ']' 'as' '[' Type ']' { Syntax.Normal.Abs.List $2 $6 }
     | Expr1 { $1 }

MatchCase :: { Syntax.Normal.Abs.MatchCase }
MatchCase : '<' Ident '=' Ident '>' '=>' Expr { Syntax.Normal.Abs.MatchCase $2 $4 $7 }

ListMatchCase :: { [Syntax.Normal.Abs.MatchCase] }
ListMatchCase : {- empty -} { [] }
              | MatchCase { (:[]) $1 }
              | MatchCase ';' ListMatchCase { (:) $1 $3 }

Binding :: { Syntax.Normal.Abs.Binding }
Binding : Ident '=' Expr { Syntax.Normal.Abs.Binding $1 $3 }

ListBinding :: { [Syntax.Normal.Abs.Binding] }
ListBinding : {- empty -} { [] }
            | Binding { (:[]) $1 }
            | Binding ',' ListBinding { (:) $1 $3 }

Expr1 :: { Syntax.Normal.Abs.Expr }
Expr1 : Expr1 Expr2 { Syntax.Normal.Abs.Application $1 $2 }
      | Expr2 { $1 }

Expr2 :: { Syntax.Normal.Abs.Expr }
Expr2 : 'cons' Expr3 Expr3 { Syntax.Normal.Abs.ConsList $2 $3 }
      | 'head' Expr3 { Syntax.Normal.Abs.Head $2 }
      | 'isempty' Expr3 { Syntax.Normal.Abs.IsEmpty $2 }
      | 'tail' Expr3 { Syntax.Normal.Abs.Tail $2 }
      | 'succ' Expr3 { Syntax.Normal.Abs.Succ $2 }
      | 'pred' Expr3 { Syntax.Normal.Abs.Pred $2 }
      | 'iszero' Expr3 { Syntax.Normal.Abs.IsZero $2 }
      | 'fix' Expr3 { Syntax.Normal.Abs.Fix $2 }
      | 'fold' '[' Type ']' Expr3 { Syntax.Normal.Abs.Fold $3 $5 }
      | 'unfold' '[' Type ']' Expr3 { Syntax.Normal.Abs.Unfold $3 $5 }
      | Expr3 { $1 }

Expr3 :: { Syntax.Normal.Abs.Expr }
Expr3 : Expr3 '.' Ident { Syntax.Normal.Abs.Dot $1 $3 }
      | 'true' { Syntax.Normal.Abs.ConstTrue }
      | 'false' { Syntax.Normal.Abs.ConstFalse }
      | '0' { Syntax.Normal.Abs.ConstZero }
      | Ident { Syntax.Normal.Abs.Var $1 }
      | '(' Expr ')' { $2 }

Type :: { Syntax.Normal.Abs.Type }
Type : Type1 '->' Type { Syntax.Normal.Abs.FunType $1 $3 }
     | 'µ' Ident '.' Type { Syntax.Normal.Abs.RecType $2 $4 }
     | Type1 { $1 }

Type1 :: { Syntax.Normal.Abs.Type }
Type1 : '{' ListFieldType '}' { Syntax.Normal.Abs.RecordType $2 }
      | '<' ListFieldType '>' { Syntax.Normal.Abs.VariantType $2 }
      | '[' Type ']' { Syntax.Normal.Abs.ListType $2 }
      | Type2 { $1 }

Type2 :: { Syntax.Normal.Abs.Type }
Type2 : 'Bool' { Syntax.Normal.Abs.BoolType }
      | 'Nat' { Syntax.Normal.Abs.NatType }
      | Ident { Syntax.Normal.Abs.VarType $1 }
      | '(' Type ')' { $2 }

FieldType :: { Syntax.Normal.Abs.FieldType }
FieldType : Ident ':' Type { Syntax.Normal.Abs.FieldType $1 $3 }

ListFieldType :: { [Syntax.Normal.Abs.FieldType] }
ListFieldType : {- empty -} { [] }
              | FieldType { (:[]) $1 }
              | FieldType ',' ListFieldType { (:) $1 $3 }

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

