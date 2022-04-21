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

        Abstraction x argType body ->
          Nameless.Abstraction (toNamelessType argType) (toNameless (x:vars) body)
        Application t1 t2 ->
          Nameless.Application (go t1) (go t2)

        Let x t1 t2 -> Nameless.Let (go t1) (toNameless (x:vars) t2)
        Record fields -> Nameless.Record (map toNamelessField fields)
        Dot t x -> Nameless.Dot (go t) (coerce x)

        Variant l t tys -> Nameless.Variant (coerce l) (go t) (map (toNamelessFieldType []) tys)
        Match t cases -> Nameless.Match (go t) (map toNamelessCase cases)
        List ts ty -> Nameless.List (map go ts) (toNamelessType ty)
        ConsList t1 t2 -> Nameless.ConsList (go t1) (go t2)
        Head t -> Nameless.Head (go t)
        Tail t -> Nameless.Tail (go t)
        IsEmpty t -> Nameless.IsEmpty (go t)

        Fix t -> Nameless.Fix (go t)

        Unfold ty t -> Nameless.Unfold (toNamelessType ty) (go t)
        Fold   ty t -> Nameless.Fold (toNamelessType ty) (go t)

    toNamelessField (Binding x t) = Nameless.Binding (coerce x) (go t)
    toNamelessCase (MatchCase l x t) = Nameless.MatchCase (coerce l) (toNameless (x:vars) t)

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

        Nameless.Abstraction argType body ->
          let z:zs = vars
           in Abstraction z (fromNamelessType_ argType) (fromNameless zs (z:used) body)
        Nameless.Application t1 t2 ->
          Application (go t1) (go t2)

        Nameless.Let t1 t2 ->
          let z:zs = vars
           in Let z (go t1) (fromNameless zs (z:used) t2)
        Nameless.Record fields -> Record (map fromNamelessField fields)
        Nameless.Dot t x -> Dot (go t) (coerce x)

        Nameless.Variant l t tys -> Variant (coerce l) (go t) (map fromNamelessFieldType_ tys)
        Nameless.Match t cases -> Match (go t) (map fromNamelessCase cases)
        Nameless.List ts ty -> List (map go ts) (fromNamelessType_ ty)
        Nameless.ConsList t1 t2 -> ConsList (go t1) (go t2)
        Nameless.Head t -> Head (go t)
        Nameless.Tail t -> Tail (go t)
        Nameless.IsEmpty t -> IsEmpty (go t)

        Nameless.Fix t -> Fix (go t)

        Nameless.Unfold ty t -> Unfold (fromNamelessType_ ty) (go t)
        Nameless.Fold ty t -> Fold (fromNamelessType_ ty) (go t)

    fromNamelessField (Nameless.Binding x t) = Binding (coerce x) (go t)
    fromNamelessCase (Nameless.MatchCase l t) =
      let z:zs = vars
       in MatchCase (coerce l) z (fromNameless zs (z:used) t)


toNamelessType :: Type -> Nameless.Type
toNamelessType = toNamelessType' []

toNamelessType' :: [Ident] -> Type -> Nameless.Type
toNamelessType' vars ty =
  case ty of
    BoolType      -> Nameless.BoolType
    NatType       -> Nameless.NatType
    FunType t1 t2 -> Nameless.FunType (toNamelessType' vars t1) (toNamelessType' vars t2)
    RecordType fields -> Nameless.RecordType (map (toNamelessFieldType vars) fields)
    VariantType cases -> Nameless.VariantType (map (toNamelessFieldType vars) cases)
    ListType t -> Nameless.ListType (toNamelessType' vars t)
    RecType x t -> Nameless.RecType (toNamelessType' (x:vars) t)
    VarType x ->
      case elemIndex x vars of
        Nothing -> Nameless.FreeTypeVar (coerce x)
        Just n  -> Nameless.BoundTypeVar (fromIntegral n)

toNamelessFieldType :: [Ident] -> FieldType -> Nameless.FieldType
toNamelessFieldType vars (FieldType x t)
  = Nameless.FieldType (coerce x) (toNamelessType' vars t)

fromNamelessType_ :: Nameless.Type -> Type
fromNamelessType_ = fromNamelessType vars []
  where
    vars = [ Ident ("X" <> show n) | n <- [1..] ]

fromNamelessType :: [Ident] -> [Ident] -> Nameless.Type -> Type
fromNamelessType freshVars usedVars ty =
  case ty of
    Nameless.BoolType      -> BoolType
    Nameless.NatType       -> NatType
    Nameless.FunType t1 t2 ->
      FunType (fromNamelessType freshVars usedVars t1) (fromNamelessType freshVars usedVars t2)
    Nameless.RecordType fields -> RecordType (map (fromNamelessFieldType freshVars usedVars) fields)
    Nameless.VariantType cases -> VariantType (map (fromNamelessFieldType freshVars usedVars) cases)
    Nameless.ListType t -> ListType (fromNamelessType freshVars usedVars t)
    Nameless.RecType t ->
      let z:zs = freshVars
       in RecType z (fromNamelessType zs (z:usedVars) t)
    Nameless.FreeTypeVar x -> VarType (coerce x)
    Nameless.BoundTypeVar i -> VarType (usedVars !! fromIntegral i)

fromNamelessFieldType_ :: Nameless.FieldType -> FieldType
fromNamelessFieldType_ (Nameless.FieldType x t)
  = FieldType (coerce x) (fromNamelessType_ t)

fromNamelessFieldType :: [Ident] -> [Ident] -> Nameless.FieldType -> FieldType
fromNamelessFieldType freshVars usedVars (Nameless.FieldType x t)
  = FieldType (coerce x) (fromNamelessType freshVars usedVars t)
