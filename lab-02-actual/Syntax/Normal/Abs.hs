-- Haskell data types for the abstract syntax.
-- Generated by the BNF converter.

{-# LANGUAGE GeneralizedNewtypeDeriving #-}

-- | The abstract syntax of language Normal.

module Syntax.Normal.Abs where

import Prelude (String)
import qualified Prelude as C (Eq, Ord, Show, Read)
import qualified Data.String

data Program = ProgramExprs [Expr]
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Expr
    = ConstTrue
    | ConstFalse
    | If Expr Expr Expr
    | ConstZero
    | Succ Expr
    | Pred Expr
    | IsZero Expr
    | Var Ident
    | Abstraction Ident Type Expr
    | Application Expr Expr
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Type = FunType Type Type | BoolType | NatType
  deriving (C.Eq, C.Ord, C.Show, C.Read)

newtype Ident = Ident String
  deriving (C.Eq, C.Ord, C.Show, C.Read, Data.String.IsString)
