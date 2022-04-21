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
    Match (Variant l t _) cases ->
      case lookupCase l cases of
        Just body -> Just (substitute (0, t) body)
        Nothing   -> Nothing

    Match t cases ->
      case evalStep t of
        Just t' -> Just (Match t' cases)
        Nothing -> Nothing

    Head (List (t:_ts) _) -> Just t
    Head t ->
      case evalStep t of
        Just t' -> Just (Head t')
        Nothing -> Nothing
    Tail (List (_t:ts) ty) -> Just (List ts ty)
    Tail t ->
      case evalStep t of
        Just t' -> Just (Tail t')
        Nothing -> Nothing

    IsEmpty (List [] _) -> Just ConstTrue
    IsEmpty (List (_:_) _) -> Just ConstFalse
    IsEmpty t ->
      case evalStep t of
        Just t' -> Just (IsEmpty t')
        Nothing -> Nothing

    ConsList t (List ts ty) -> Just (List (t:ts) ty)
    ConsList h t ->
      case evalStep t of
        Just t' -> Just (ConsList h t')
        Nothing -> Nothing

    Dot (Record fields) l -> lookupField l fields
    Dot t l ->
      case evalStep t of
        Just t' -> Just (Dot t' l)
        Nothing -> Nothing

    Fix t -> Just (Application t (Fix t))

    Unfold _ty (Fold _ty' t) -> Just t

    Unfold ty t ->
      case evalStep t of
        Just t' -> Just (Unfold ty t')
        Nothing -> Nothing

    Fold ty t ->
      case evalStep t of
        Just t' -> Just (Fold ty t')
        Nothing -> Nothing

    Abstraction _ _ -> Nothing
    Record _ -> Nothing
    Variant _ _ _ -> Nothing
    List _ _ -> Nothing
    ConstTrue -> Nothing
    ConstFalse -> Nothing
    ConstZero -> Nothing
    FreeVar _ -> Nothing
    BoundVar _ -> Nothing

lookupCase :: Ident -> [MatchCase] -> Maybe Expr
lookupCase l cases = lookup l (map toPair cases)
  where
    toPair (MatchCase l' t) = (l', t)

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

        Variant l t tys -> Variant l (go t) tys
        Match t cases -> Match (go t) (map shiftCase cases)
        List ts ty -> List (map go ts) ty
        ConsList h t -> ConsList (go h) (go t)
        Head t -> Head (go t)
        Tail t -> Tail (go t)
        IsEmpty t -> IsEmpty (go t)

        Fix t -> Fix (go t)

        Unfold ty t -> Unfold ty (go t)
        Fold   ty t -> Fold ty (go t)

    shiftField (Binding x t) = Binding x (go t)
    shiftCase (MatchCase l t) = MatchCase l (shiftFrom (k + 1) t)

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
        Record fields -> Record (map substituteField fields)
        Dot t x -> Dot (go t) x

        Variant l t tys -> Variant l (go t) tys
        Match t cases -> Match (go t) (map substituteCase cases)
        List ts ty -> List (map go ts) ty
        ConsList h t -> ConsList (go h) (go t)
        Head t -> Head (go t)
        Tail t -> Tail (go t)
        IsEmpty t -> IsEmpty (go t)

        Fix t -> Fix (go t)

        Unfold ty t -> Unfold ty (go t)
        Fold   ty t -> Fold ty (go t)

    substituteField (Binding x t) = Binding x (go t)
    substituteCase (MatchCase l t) = MatchCase l (substitute (n + 1, shift s) t)

shiftTypeFrom :: Integer -> Type -> Type
shiftTypeFrom k = go
  where
    go ty =
      case ty of
        BoundTypeVar n
          | n >= k    -> BoundTypeVar (n + 1)
          | otherwise -> ty
        FreeTypeVar _ -> ty
        RecType body -> RecType (shiftTypeFrom (k + 1) body)
        FunType t1 t2 -> FunType (go t1) (go t2)
        RecordType fields -> RecordType (map shiftFieldTypeFrom fields)
        VariantType fields -> VariantType (map shiftFieldTypeFrom fields)
        ListType t -> ListType (go t)
        BoolType -> BoolType
        NatType -> NatType

    shiftFieldTypeFrom (FieldType l ty) = FieldType l (go ty)

shiftType :: Type -> Type
shiftType = shiftTypeFrom 0

substituteType :: (Integer, Type) -> Type -> Type
substituteType (n, s) = go
  where
    go ty =
      case ty of
        BoundTypeVar m
          | n == m -> s
          | otherwise -> ty
        FreeTypeVar _ -> ty
        RecType body -> RecType (substituteType (n + 1, shiftType s) body)
        FunType t1 t2 -> FunType (go t1) (go t2)
        RecordType fields -> RecordType (map substFieldTypeFrom fields)
        VariantType fields -> VariantType (map substFieldTypeFrom fields)
        ListType t -> ListType (go t)
        BoolType -> BoolType
        NatType -> NatType

    substFieldTypeFrom (FieldType l ty) = FieldType l (go ty)

