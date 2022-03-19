{-# OPTIONS_GHC -Wall -fno-warn-type-defaults #-}
module Convert where

import           Data.Coerce         (coerce)
import           Data.List           (elemIndex)
import qualified Syntax.Nameless.Abs as Nameless
import           Syntax.Normal.Abs

toNameless_ :: Expr -> Nameless.Expr
toNameless_ = toNameless []

toNameless :: [Ident] -> Expr -> Nameless.Expr
toNameless vars = go
  where
    go expr =
      case expr of
        ConstTrue  -> Nameless.ConstTrue
        ConstFalse -> Nameless.ConstFalse
        If t1 t2 t3 -> Nameless.If
          (go t1) (go t2) (go t3)

        ConstZero -> Nameless.ConstZero
        Succ t -> Nameless.Succ (go t)
        Pred t -> Nameless.Pred (go t)
        IsZero t -> Nameless.IsZero (go t)

        Var x ->
          case elemIndex x vars of
            Nothing -> Nameless.FreeVar (coerce x)
            Just n  -> Nameless.BoundVar (fromIntegral n)

        Abstraction x body ->
          Nameless.Abstraction (toNameless (x:vars) body)
        Application t1 t2 ->
          Nameless.Application (go t1) (go t2)

fromNameless_ :: Nameless.Expr -> Expr
fromNameless_ = fromNameless vars []
  where
    vars = [ Ident ("x" <> show n) | n <- [1..] ]

fromNameless :: [Ident] -> [Ident] -> Nameless.Expr -> Expr
fromNameless vars used = go
  where
    go expr =
      case expr of
        Nameless.ConstTrue  -> ConstTrue
        Nameless.ConstFalse -> ConstFalse
        Nameless.If t1 t2 t3 -> If
          (go t1) (go t2) (go t3)

        Nameless.ConstZero -> ConstZero
        Nameless.Succ t -> Succ (go t)
        Nameless.Pred t -> Pred (go t)
        Nameless.IsZero t -> IsZero (go t)

        Nameless.FreeVar  x -> Var (coerce x)
        Nameless.BoundVar n -> Var (used !! fromIntegral n)

        Nameless.Abstraction body ->
          let z:zs = vars
           in Abstraction z (fromNameless zs (z:used) body)
        Nameless.Application t1 t2 ->
          Application (go t1) (go t2)

