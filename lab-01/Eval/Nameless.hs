{-# OPTIONS_GHC -Wall #-}
module Eval.Nameless where

import           Syntax.Nameless.Abs

eval' :: Expr -> Expr
eval' expr =
  case expr of
    Application fun arg ->
      case eval' fun of
        Abstraction body -> eval' (substitute (0, arg) body)
        fun'             -> Application fun' arg
    _ -> expr

eval :: Expr -> Expr
eval expr =
  case evalStep expr of
    Nothing    -> expr
    Just expr' -> eval expr'

evalStep :: Expr -> Maybe Expr
evalStep expr =
  case expr of
    Application (Abstraction body) arg ->
      Just (substitute (0, arg) body)
    Application t1 t2 ->
      case evalStep t1 of
        Just u1 -> Just (Application u1 t2)
        Nothing ->
          case evalStep t2 of
            Just u2 -> Just (Application t1 u2)
            Nothing -> Nothing
    _ -> Nothing

substitute :: (Integer, Expr) -> Expr -> Expr
substitute (n, s) expr =
  case expr of
    ConstTrue -> ConstTrue
    ConstFalse -> ConstFalse
    ConstZero -> ConstZero

    If t1 t2 t3 -> If
      (substitute (n, s) t1)
      (substitute (n, s) t2)
      (substitute (n, s) t3)

    Succ t -> Succ (substitute (n, s) t)
    Pred t -> Pred (substitute (n, s) t)
    IsZero t -> IsZero (substitute (n, s) t)

    BoundVar m ->
      if n == m
         then s
         else expr
    FreeVar _ -> expr
    Abstraction t -> Abstraction (substitute (n+1, shift s) t)
    Application t1 t2 -> Application (substitute (n, s) t1) (substitute (n, s) t2)

shift :: Expr -> Expr
shift = shiftFrom 0

shiftFrom :: Integer -> Expr -> Expr
shiftFrom k expr =
  case expr of
    BoundVar n
      | n < k -> expr
      | otherwise -> BoundVar (n + 1)
    FreeVar _ -> expr
    Abstraction t -> Abstraction (shiftFrom (k + 1) t)
    Application t1 t2 -> Application (shiftFrom k t1) (shiftFrom k t2)

    ConstTrue -> ConstTrue
    ConstFalse -> ConstFalse
    ConstZero -> ConstZero

    If t1 t2 t3 -> If
      (shiftFrom k t1)
      (shiftFrom k t2)
      (shiftFrom k t3)

    Succ t -> Succ (shiftFrom k t)
    Pred t -> Pred (shiftFrom k t)
    IsZero t -> IsZero (shiftFrom k t)
