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

transExpr :: Syntax.Nameless.Abs.Expr -> Result
transExpr x = case x of
  Syntax.Nameless.Abs.ConstTrue -> failure x
  Syntax.Nameless.Abs.ConstFalse -> failure x
  Syntax.Nameless.Abs.If expr1 expr2 expr3 -> failure x
  Syntax.Nameless.Abs.ConstZero -> failure x
  Syntax.Nameless.Abs.Succ expr -> failure x
  Syntax.Nameless.Abs.Pred expr -> failure x
  Syntax.Nameless.Abs.IsZero expr -> failure x
  Syntax.Nameless.Abs.FreeVar ident -> failure x
  Syntax.Nameless.Abs.BoundVar integer -> failure x
  Syntax.Nameless.Abs.Abstraction type_ expr -> failure x
  Syntax.Nameless.Abs.Application expr1 expr2 -> failure x

transType :: Syntax.Nameless.Abs.Type -> Result
transType x = case x of
  Syntax.Nameless.Abs.BoolType -> failure x
  Syntax.Nameless.Abs.NatType -> failure x
  Syntax.Nameless.Abs.FunType type_1 type_2 -> failure x
