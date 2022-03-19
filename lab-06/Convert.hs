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

        Assign t1 t2 -> Nameless.Assign (go t1) (go t2)
        Seq ts -> Nameless.Seq (map go ts)
        NewRef t -> Nameless.NewRef (go t)
        DeRef t -> Nameless.DeRef (go t)
        ConstUnit -> Nameless.ConstUnit
        Location l -> Nameless.Location (coerce l)

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

        Nameless.Assign t1 t2 -> Assign (go t1) (go t2)
        Nameless.Seq ts -> Seq (map go ts)
        Nameless.NewRef t -> NewRef (go t)
        Nameless.DeRef t -> DeRef (go t)
        Nameless.ConstUnit -> ConstUnit
        Nameless.Location l -> Location (coerce l)

toNamelessType :: Type -> Nameless.Type
toNamelessType ty =
  case ty of
    BoolType      -> Nameless.BoolType
    NatType       -> Nameless.NatType
    UnitType      -> Nameless.UnitType
    RefType t     -> Nameless.RefType (toNamelessType t)
    FunType t1 t2 -> Nameless.FunType (toNamelessType t1) (toNamelessType t2)

fromNamelessType :: Nameless.Type -> Type
fromNamelessType ty =
  case ty of
    Nameless.BoolType      -> BoolType
    Nameless.NatType       -> NatType
    Nameless.UnitType      -> UnitType
    Nameless.RefType t     -> RefType (fromNamelessType t)
    Nameless.FunType t1 t2 -> FunType (fromNamelessType t1) (fromNamelessType t2)

toNamelessStore :: Store -> Nameless.Store
toNamelessStore (Store assignments) = Nameless.Store (map toNamelessAssignment assignments)

toNamelessAssignment :: Assignment -> Nameless.Assignment
toNamelessAssignment (Assignment l t) = Nameless.Assignment (coerce l) (toNameless_ t)

fromNamelessStore :: Nameless.Store -> Store
fromNamelessStore (Nameless.Store assignments) = Store (map fromNamelessAssignment assignments)

fromNamelessAssignment :: Nameless.Assignment -> Assignment
fromNamelessAssignment (Nameless.Assignment l t) = Assignment (coerce l) (fromNameless_ t)
