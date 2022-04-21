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
    = If Expr Expr Expr
    | Let Expr Expr
    | Abstraction Type Expr
    | Record [Binding]
    | Variant Ident Expr
    | Match Expr [MatchCase]
    | List [Expr]
    | Application Expr Expr
    | ConsList Expr Expr
    | Head Expr
    | Tail Expr
    | Succ Expr
    | Pred Expr
    | IsZero Expr
    | Fix Expr
    | IsEmpty Expr
    | Dot Expr Ident
    | ConstTrue
    | ConstFalse
    | ConstZero
    | FreeVar Ident
    | BoundVar Integer
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data MatchCase = MatchCase Ident Expr
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Binding = Binding Ident Expr
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Type
    = FunType Type Type
    | RecordType [FieldType]
    | VariantType [FieldType]
    | ListType Type
    | BoolType
    | NatType
    | TopType
    | BotType
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data FieldType = FieldType Ident Type
  deriving (C.Eq, C.Ord, C.Show, C.Read)

data Typing = Typing Expr Type
  deriving (C.Eq, C.Ord, C.Show, C.Read)

newtype Ident = Ident String
  deriving (C.Eq, C.Ord, C.Show, C.Read, Data.String.IsString)

