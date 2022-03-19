{-# OPTIONS_GHC -Wall #-}
module Eval.Nameless where

import           Syntax.Nameless.Abs

isValue :: Expr -> Bool
isValue expr =
  case expr of
    ConstTrue       -> True
    ConstFalse      -> True
    ConstUnit       -> True
    Abstraction _ _ -> True
    Location _      -> True
    _               -> isNatValue expr

isNatValue :: Expr -> Bool
isNatValue expr =
  case expr of
    ConstZero -> True
    Succ v    -> isNatValue v
    _         -> False

evalStep :: (Expr, Store) -> Maybe (Expr, Store)
evalStep (expr, store) =
  case expr of
    If ConstTrue  t2 _t3 -> Just (t2, store)
    If ConstFalse _t2 t3 -> Just (t3, store)
    If t1 t2 t3 ->
      case evalStep (t1, store) of
        Nothing            -> Nothing
        Just (t1', store') -> Just (If t1' t2 t3, store')

    Succ t ->
      case evalStep (t, store) of
        Nothing           -> Nothing
        Just (t', store') -> Just (Succ t', store')

    Pred ConstZero -> Just (ConstZero, store)
    Pred (Succ t)  -> Just (t, store)
    Pred t ->
      case evalStep (t, store) of
        Nothing           -> Nothing
        Just (t', store') -> Just (Pred t', store')

    IsZero ConstZero -> Just (ConstTrue, store)
    IsZero (Succ _)  -> Just (ConstFalse, store)
    IsZero t ->
      case evalStep (t, store) of
        Nothing           -> Nothing
        Just (t', store') -> Just (IsZero t', store')

    Application f@(Abstraction _ body) arg ->
      case evalStep (arg, store) of
        Just (arg', store') -> Just (Application f arg', store')
        Nothing
          | isValue arg -> Just (substitute (0, arg) body, store)
          | otherwise   -> Nothing
    Application t1 t2 ->
      case evalStep (t1, store) of
        Nothing            -> Nothing
        Just (t1', store') -> Just (Application t1' t2, store')

    Seq [] -> Just (ConstUnit, store)
    Seq (t:ts) ->
      case evalStep (t, store) of
        Just (t', store') -> Just (Seq (t' : ts), store')
        Nothing ->
          case ts of
            [] -> Just (t, store)
            _ | isValue t -> Just (Seq ts, store)
              | otherwise -> Nothing

    Assign (Location l) t ->
      case evalStep (t, store) of
        Just (t', store') -> Just (Assign (Location l) t', store')
        Nothing
          | isValue t -> Just (ConstUnit, assign (l, t) store)
          | otherwise -> Nothing
    Assign t1 t2 ->
      case evalStep (t1, store) of
        Just (t1', store') -> Just (Assign t1' t2, store')
        Nothing            -> Nothing

    NewRef t ->
      case evalStep (t, store) of
        Just (t', store') -> Just (NewRef t', store')
        Nothing
          | isValue t ->
              case newRef t store of
                (store', l) -> Just (Location l, store')
          | otherwise -> Nothing

    DeRef (Location l) ->
      case lookupAssignment l store of
        Just t  -> Just (t, store)
        Nothing -> Nothing
    DeRef t ->
      case evalStep (t, store) of
        Just (t', store') -> Just (DeRef t', store')
        Nothing           -> Nothing

    ConstUnit -> Nothing
    ConstZero -> Nothing
    ConstTrue -> Nothing
    ConstFalse -> Nothing

    Abstraction _ _ -> Nothing
    FreeVar _ -> Nothing
    BoundVar _ -> Nothing
    Location _ -> Nothing

lookupAssignment :: Integer -> Store -> Maybe Expr
lookupAssignment l (Store assignment) = lookup l (map toPair assignment)
  where
    toPair (Assignment x t) = (x, t)

assign :: (Integer, Expr) -> Store -> Store
assign (l, t) (Store assignments) = Store (Assignment l t : assignments)

newRef :: Expr -> Store -> (Store, Integer)
newRef t (Store assignments) = (assign (l, t) (Store assignments), l)
  where
    l = 1 + maximum (0 : map (\(Assignment x _) -> x) assignments)

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

        Assign t1 t2 -> Assign (go t1) (go t2)
        Seq ts -> Seq (map go ts)
        NewRef t -> NewRef (go t)
        DeRef t -> DeRef (go t)
        ConstUnit -> ConstUnit
        Location l -> Location l

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

        Assign t1 t2 -> Assign (go t1) (go t2)
        Seq ts -> Seq (map go ts)
        NewRef t -> NewRef (go t)
        DeRef t -> DeRef (go t)
        ConstUnit -> ConstUnit
        Location l -> Location l
