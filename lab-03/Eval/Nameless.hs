{-# OPTIONS_GHC -Wall #-}
module Eval.Nameless where

import           Syntax.Nameless.Abs

isValue :: Expr -> Bool
isValue expr =
  case expr of
    ConstTrue       -> True
    ConstFalse      -> True
    Abstraction _ _ -> True
    _               -> isNatValue expr

isNatValue :: Expr -> Bool
isNatValue expr =
  case expr of
    ConstZero -> True
    Succ v    -> isNatValue v
    _         -> False

evalStep :: Expr -> Maybe Expr
evalStep expr =
  case expr of
    If ConstTrue  t2 _t3 -> Just t2
    If ConstFalse _t2 t3 -> Just t3
    If t1 t2 t3 ->
      case evalStep t1 of
        Nothing  -> Nothing
        Just t1' -> Just (If t1' t2 t3)

    Succ t ->
      case evalStep t of
        Nothing -> Nothing
        Just t' -> Just (Succ t')

    Pred ConstZero -> Just ConstZero
    Pred (Succ t)  -> Just t
    Pred t ->
      case evalStep t of
        Nothing -> Nothing
        Just t' -> Just (Pred t')

    IsZero ConstZero -> Just ConstTrue
    IsZero (Succ _)  -> Just ConstFalse
    IsZero t ->
      case evalStep t of
        Nothing -> Nothing
        Just t' -> Just (IsZero t')

    Application (Abstraction _ body) arg ->
      Just (substitute (0, arg) body)
    Application t1 t2 ->
      case evalStep t1 of
        Nothing  -> Nothing
        Just t1' -> Just (Application t1' t2)

    Let t1 t2 -> Just (substitute (0, t1) t2)

    Dot (Record fields) l -> lookupField l fields
    Dot t l ->
      case evalStep t of
        Just t' -> Just (Dot t' l)
        Nothing -> Nothing

    Abstraction _ _ -> Nothing
    Record _ -> Nothing
    ConstTrue -> Nothing
    ConstFalse -> Nothing
    ConstZero -> Nothing
    FreeVar _ -> Nothing
    BoundVar _ -> Nothing

lookupField :: Ident -> [Binding] -> Maybe Expr
lookupField l cases = lookup l (map toPair cases)
  where
    toPair (Binding l' t) = (l', t)

shiftFrom :: Integer -> Expr -> Expr
shiftFrom k = go
  where
    go expr =
      case expr of
        BoundVar n
          | n >= k    -> BoundVar (n + 1)
          | otherwise -> expr
        FreeVar _ -> expr
        Abstraction ty body -> Abstraction ty (shiftFrom (k + 1) body)
        Application t1 t2 -> Application (go t1) (go t2)

        ConstTrue -> ConstTrue
        ConstFalse -> ConstFalse
        If t1 t2 t3 -> If (go t1) (go t2) (go t3)

        ConstZero -> ConstZero
        Succ t -> Succ (go t)
        Pred t -> Pred (go t)
        IsZero t -> IsZero (go t)

        Let t1 t2 -> Let (go t1) (shiftFrom (k + 1) t2)
        Record fields -> Record (map shiftField fields)
        Dot t x -> Dot (go t) x

    shiftField (Binding x t) = Binding x (go t)

shift :: Expr -> Expr
shift = shiftFrom 0

substitute :: (Integer, Expr) -> Expr -> Expr
substitute (n, s) = go
  where
    go expr =
      case expr of
        BoundVar m
          | n == m -> s
          | otherwise -> expr
        FreeVar _ -> expr
        Abstraction ty body -> Abstraction ty (substitute (n + 1, shift s) body)
        Application t1 t2 -> Application (go t1) (go t2)

        ConstTrue -> ConstTrue
        ConstFalse -> ConstFalse
        If t1 t2 t3 -> If (go t1) (go t2) (go t3)

        ConstZero -> ConstZero
        Succ t -> Succ (go t)
        Pred t -> Pred (go t)
        IsZero t -> IsZero (go t)

        Let t1 t2 -> Let (go t1) (substitute (n + 1, shift s) t2)
        Record fields -> Record (map shiftField fields)
        Dot t x -> Dot (go t) x

    shiftField (Binding x t) = Binding x (go t)
