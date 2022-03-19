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
  Syntax.Nameless.Abs.ProgramExprs expr -> failure x

transExpr :: Syntax.Nameless.Abs.Expr -> Result
transExpr x = case x of
  Syntax.Nameless.Abs.Seq exprs -> failure x
  Syntax.Nameless.Abs.If expr1 expr2 expr3 -> failure x
  Syntax.Nameless.Abs.Abstraction type_ expr -> failure x
  Syntax.Nameless.Abs.Assign expr1 expr2 -> failure x
  Syntax.Nameless.Abs.Application expr1 expr2 -> failure x
  Syntax.Nameless.Abs.NewRef expr -> failure x
  Syntax.Nameless.Abs.DeRef expr -> failure x
  Syntax.Nameless.Abs.Succ expr -> failure x
  Syntax.Nameless.Abs.Pred expr -> failure x
  Syntax.Nameless.Abs.IsZero expr -> failure x
  Syntax.Nameless.Abs.ConstUnit -> failure x
  Syntax.Nameless.Abs.ConstTrue -> failure x
  Syntax.Nameless.Abs.ConstFalse -> failure x
  Syntax.Nameless.Abs.ConstZero -> failure x
  Syntax.Nameless.Abs.FreeVar ident -> failure x
  Syntax.Nameless.Abs.BoundVar integer -> failure x
  Syntax.Nameless.Abs.Location integer -> failure x

transStore :: Syntax.Nameless.Abs.Store -> Result
transStore x = case x of
  Syntax.Nameless.Abs.Store assignments -> failure x

transAssignment :: Syntax.Nameless.Abs.Assignment -> Result
transAssignment x = case x of
  Syntax.Nameless.Abs.Assignment integer expr -> failure x

transStoreTyping :: Syntax.Nameless.Abs.StoreTyping -> Result
transStoreTyping x = case x of
  Syntax.Nameless.Abs.StoreTyping locationtypings -> failure x

transLocationTyping :: Syntax.Nameless.Abs.LocationTyping -> Result
transLocationTyping x = case x of
  Syntax.Nameless.Abs.LocationTyping integer type_ -> failure x

transType :: Syntax.Nameless.Abs.Type -> Result
transType x = case x of
  Syntax.Nameless.Abs.FunType type_1 type_2 -> failure x
  Syntax.Nameless.Abs.RefType type_ -> failure x
  Syntax.Nameless.Abs.BoolType -> failure x
  Syntax.Nameless.Abs.NatType -> failure x
  Syntax.Nameless.Abs.UnitType -> failure x

transTyping :: Syntax.Nameless.Abs.Typing -> Result
transTyping x = case x of
  Syntax.Nameless.Abs.Typing expr type_ -> failure x