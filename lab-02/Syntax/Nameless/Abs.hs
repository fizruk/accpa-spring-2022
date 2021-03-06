-- Haskell data types for the abstract syntax.
-- Generated by the BNF converter.

{-# LANGUAGE GeneralizedNewtypeDeriving #-}

-- | The abstract syntax of language Nameless.

module Syntax.Nameless.Abs where

import Prelude (Integer, String)
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
    | FreeVar Ident
    | BoundVar Integer
    | Abstraction Type Expr
    | Application Expr Expr
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Type = FunType Type Type | BoolType | NatType
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Typing = Typing Expr Type
  deriving (C.Eq, C.Ord, C.Show, C.Read)

newtype Ident = Ident String
  deriving (C.Eq, C.Ord, C.Show, C.Read, Data.String.IsString)

