{-# OPTIONS_GHC -Wall -fno-warn-type-defaults #-}
module Convert where

import           Data.Coerce         (coerce)
import           Data.List           (elemIndex)
import           Syntax.Nameless.Abs as Nameless
import           Syntax.Normal.Abs   as Syntax

toNameless_ :: Syntax.Expr -> Nameless.Expr
toNameless_ = toNameless []

toNameless :: [Syntax.Ident] -> Syntax.Expr -> Nameless.Expr
toNameless vars = go
  where
    go expr =
      case expr of
        Syntax.ConstTrue  -> Nameless.ConstTrue
        Syntax.ConstFalse -> Nameless.ConstFalse
        Syntax.If t1 t2 t3 -> Nameless.If
          (go t1) (go t2) (go t3)

        Syntax.ConstZero -> Nameless.ConstZero
        Syntax.Succ t -> Nameless.Succ (go t)
        Syntax.Pred t -> Nameless.Pred (go t)
        Syntax.IsZero t -> Nameless.IsZero (go t)

        Syntax.Var x ->
          case elemIndex x vars of
            Nothing -> Nameless.FreeVar (coerce x)
            Just n  -> Nameless.BoundVar (fromIntegral n)

        Syntax.Abstraction x body ->
          Nameless.Abstraction (toNameless (x:vars) body)
        Syntax.Application t1 t2 ->
          Nameless.Application (go t1) (go t2)

fromNameless_ :: Nameless.Expr -> Syntax.Expr
fromNameless_ = fromNameless vars []
  where
    vars = [ Syntax.Ident ("x" <> show n) | n <- [1..] ]

fromNameless :: [Syntax.Ident] -> [Syntax.Ident] -> Nameless.Expr -> Syntax.Expr
fromNameless vars used = go
  where
    go expr =
      case expr of
        Nameless.ConstTrue  -> Syntax.ConstTrue
        Nameless.ConstFalse -> Syntax.ConstFalse
        Nameless.If t1 t2 t3 -> Syntax.If
          (go t1) (go t2) (go t3)

        Nameless.ConstZero -> Syntax.ConstZero
        Nameless.Succ t -> Syntax.Succ (go t)
        Nameless.Pred t -> Syntax.Pred (go t)
        Nameless.IsZero t -> Syntax.IsZero (go t)

        Nameless.FreeVar  x -> Syntax.Var (coerce x)
        Nameless.BoundVar n -> Syntax.Var (used !! fromIntegral n)

        Nameless.Abstraction body ->
          let z:zs = vars
           in Syntax.Abstraction z (fromNameless zs (z:used) body)
        Nameless.Application t1 t2 ->
          Syntax.Application (go t1) (go t2)

