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

    toNamelessField (Binding x t) = Nameless.Binding (coerce x) (go t)

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
           in Abstraction z (fromNamelessType argType) (fromNameless zs (z:used) body)
        Nameless.Application t1 t2 ->
          Application (go t1) (go t2)

        Nameless.Let t1 t2 ->
          let z:zs = vars
           in Let z (go t1) (fromNameless zs (z:used) t2)
        Nameless.Record fields -> Record (map fromNamelessField fields)
        Nameless.Dot t x -> Dot (go t) (coerce x)

    fromNamelessField (Nameless.Binding x t) = Binding (coerce x) (go t)

toNamelessType :: Type -> Nameless.Type
toNamelessType ty =
  case ty of
    BoolType      -> Nameless.BoolType
    NatType       -> Nameless.NatType
    FunType t1 t2 -> Nameless.FunType (toNamelessType t1) (toNamelessType t2)
    RecordType fields -> Nameless.RecordType (map convertField fields)
  where
    convertField (FieldType x t) = Nameless.FieldType (coerce x) (toNamelessType t)

fromNamelessType :: Nameless.Type -> Type
fromNamelessType ty =
  case ty of
    Nameless.BoolType      -> BoolType
    Nameless.NatType       -> NatType
    Nameless.FunType t1 t2 -> FunType (fromNamelessType t1) (fromNamelessType t2)
    Nameless.RecordType fields -> RecordType (map convertField fields)
  where
    convertField (Nameless.FieldType x t) = FieldType (coerce x) (fromNamelessType t)
