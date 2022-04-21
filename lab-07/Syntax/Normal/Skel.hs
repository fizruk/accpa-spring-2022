-- Haskell module generated by the BNF converter

{-# OPTIONS_GHC -fno-warn-unused-matches #-}

module Syntax.Normal.Skel where

import Prelude (($), Either(..), String, (++), Show, show)
import qualified Syntax.Normal.Abs

type Err = Either String
type Result = Err String

failure :: Show a => a -> Result
failure x = Left $ "Undefined case: " ++ show x

transIdent :: Syntax.Normal.Abs.Ident -> Result
transIdent x = case x of
  Syntax.Normal.Abs.Ident string -> failure x

transProgram :: Syntax.Normal.Abs.Program -> Result
transProgram x = case x of
  Syntax.Normal.Abs.ProgramExprs exprs -> failure x

transExpr :: Syntax.Normal.Abs.Expr -> Result
transExpr x = case x of
  Syntax.Normal.Abs.If expr1 expr2 expr3 -> failure x
  Syntax.Normal.Abs.Let ident expr1 expr2 -> failure x
  Syntax.Normal.Abs.Abstraction ident type_ expr -> failure x
  Syntax.Normal.Abs.Record bindings -> failure x
  Syntax.Normal.Abs.Variant ident expr -> failure x
  Syntax.Normal.Abs.Match expr matchcases -> failure x
  Syntax.Normal.Abs.List exprs -> failure x
  Syntax.Normal.Abs.Application expr1 expr2 -> failure x
  Syntax.Normal.Abs.ConsList expr1 expr2 -> failure x
  Syntax.Normal.Abs.Head expr -> failure x
  Syntax.Normal.Abs.IsEmpty expr -> failure x
  Syntax.Normal.Abs.Tail expr -> failure x
  Syntax.Normal.Abs.Succ expr -> failure x
  Syntax.Normal.Abs.Pred expr -> failure x
  Syntax.Normal.Abs.IsZero expr -> failure x
  Syntax.Normal.Abs.Fix expr -> failure x
  Syntax.Normal.Abs.Dot expr ident -> failure x
  Syntax.Normal.Abs.ConstTrue -> failure x
  Syntax.Normal.Abs.ConstFalse -> failure x
  Syntax.Normal.Abs.ConstZero -> failure x
  Syntax.Normal.Abs.Var ident -> failure x

transMatchCase :: Syntax.Normal.Abs.MatchCase -> Result
transMatchCase x = case x of
  Syntax.Normal.Abs.MatchCase ident1 ident2 expr -> failure x

transBinding :: Syntax.Normal.Abs.Binding -> Result
transBinding x = case x of
  Syntax.Normal.Abs.Binding ident expr -> failure x

transType :: Syntax.Normal.Abs.Type -> Result
transType x = case x of
  Syntax.Normal.Abs.FunType type_1 type_2 -> failure x
  Syntax.Normal.Abs.RecordType fieldtypes -> failure x
  Syntax.Normal.Abs.VariantType fieldtypes -> failure x
  Syntax.Normal.Abs.ListType type_ -> failure x
  Syntax.Normal.Abs.BoolType -> failure x
  Syntax.Normal.Abs.NatType -> failure x
  Syntax.Normal.Abs.TopType -> failure x
  Syntax.Normal.Abs.BotType -> failure x

transFieldType :: Syntax.Normal.Abs.FieldType -> Result
transFieldType x = case x of
  Syntax.Normal.Abs.FieldType ident type_ -> failure x

transTyping :: Syntax.Normal.Abs.Typing -> Result
transTyping x = case x of
  Syntax.Normal.Abs.Typing expr type_ -> failure x
