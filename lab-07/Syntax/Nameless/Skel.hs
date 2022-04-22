-- Haskell module generated by the BNF converter

{-# OPTIONS_GHC -fno-warn-unused-matches #-}

module Syntax.Nameless.Skel where

import Prelude (($), Either(..), String, (++), Show, show)
import qualified Syntax.Nameless.Abs

type Err = Either String
type Result = Err String

failure :: Show a => a -> Result
failure x = Left $ "Undefined case: " ++ show x

transIdent :: Syntax.Nameless.Abs.Ident -> Result
transIdent x = case x of
  Syntax.Nameless.Abs.Ident string -> failure x

transProgram :: Syntax.Nameless.Abs.Program -> Result
transProgram x = case x of
  Syntax.Nameless.Abs.ProgramExprs exprs -> failure x

transExpr :: Syntax.Nameless.Abs.Expr -> Result
transExpr x = case x of
  Syntax.Nameless.Abs.If expr1 expr2 expr3 -> failure x
  Syntax.Nameless.Abs.Let expr1 expr2 -> failure x
  Syntax.Nameless.Abs.Abstraction type_ expr -> failure x
  Syntax.Nameless.Abs.Record bindings -> failure x
  Syntax.Nameless.Abs.Variant ident expr -> failure x
  Syntax.Nameless.Abs.Match expr matchcases -> failure x
  Syntax.Nameless.Abs.List exprs -> failure x
  Syntax.Nameless.Abs.Application expr1 expr2 -> failure x
  Syntax.Nameless.Abs.ConsList expr1 expr2 -> failure x
  Syntax.Nameless.Abs.Head expr -> failure x
  Syntax.Nameless.Abs.Tail expr -> failure x
  Syntax.Nameless.Abs.Succ expr -> failure x
  Syntax.Nameless.Abs.Pred expr -> failure x
  Syntax.Nameless.Abs.IsZero expr -> failure x
  Syntax.Nameless.Abs.Fix expr -> failure x
  Syntax.Nameless.Abs.IsEmpty expr -> failure x
  Syntax.Nameless.Abs.Dot expr ident -> failure x
  Syntax.Nameless.Abs.ConstTrue -> failure x
  Syntax.Nameless.Abs.ConstFalse -> failure x
  Syntax.Nameless.Abs.ConstZero -> failure x
  Syntax.Nameless.Abs.FreeVar ident -> failure x
  Syntax.Nameless.Abs.BoundVar integer -> failure x

transMatchCase :: Syntax.Nameless.Abs.MatchCase -> Result
transMatchCase x = case x of
  Syntax.Nameless.Abs.MatchCase ident expr -> failure x

transBinding :: Syntax.Nameless.Abs.Binding -> Result
transBinding x = case x of
  Syntax.Nameless.Abs.Binding ident expr -> failure x

transType :: Syntax.Nameless.Abs.Type -> Result
transType x = case x of
  Syntax.Nameless.Abs.FunType type_1 type_2 -> failure x
  Syntax.Nameless.Abs.RecordType fieldtypes -> failure x
  Syntax.Nameless.Abs.VariantType fieldtypes -> failure x
  Syntax.Nameless.Abs.ListType type_ -> failure x
  Syntax.Nameless.Abs.BoolType -> failure x
  Syntax.Nameless.Abs.NatType -> failure x
  Syntax.Nameless.Abs.TopType -> failure x
  Syntax.Nameless.Abs.BotType -> failure x

transFieldType :: Syntax.Nameless.Abs.FieldType -> Result
transFieldType x = case x of
  Syntax.Nameless.Abs.FieldType ident type_ -> failure x

transTyping :: Syntax.Nameless.Abs.Typing -> Result
transTyping x = case x of
  Syntax.Nameless.Abs.Typing expr type_ -> failure x