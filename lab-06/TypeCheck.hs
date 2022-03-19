{-# OPTIONS_GHC -Wall -fno-warn-unused-do-bind #-}
module TypeCheck where

import           Syntax.Normal.Abs
import           Syntax.Normal.Print (printTree)

type Context = [(Ident, Type)]

expectedRefType :: Expr -> Type -> Either String a
expectedRefType expr actual = Left $ unlines
  [ "expected reference type"
  , "but actual type is"
  , "  " <> printTree actual
  , "for the expression"
  , "  " <> printTree expr
  ]

expectedFunType :: Expr -> Type -> Either String a
expectedFunType expr actual = Left $ unlines
  [ "expected function type"
  , "but actual type is"
  , "  " <> printTree actual
  , "for the expression"
  , "  " <> printTree expr
  ]

typeMismatch :: Typing -> Type -> Either String a
typeMismatch (Typing expr expected) actual = Left $ unlines
  [ "expected type"
  , "  " <> printTree expected
  , "but actual type is"
  , "  " <> printTree actual
  , "for the expression"
  , "  " <> printTree expr
  ]

undefinedVar :: Expr -> Either String a
undefinedVar expr = Left $ unlines
  [ "undefined variable with unknown type"
  , "  " <> printTree expr
  ]

undefinedLocation :: Expr -> Either String a
undefinedLocation expr = Left $ unlines
  [ "undefined variable with unknown type"
  , "  " <> printTree expr
  ]

typecheck :: StoreTyping -> Context -> Typing -> Either String Typing
typecheck store context typing@(Typing expr expectedType) = do
  actualType <- typeOf store context expr
  if actualType == expectedType
    then Right typing
    else typeMismatch typing actualType

typeOf :: StoreTyping -> Context -> Expr -> Either String Type
typeOf store context expr =
  case expr of
    ConstTrue   -> return BoolType
    ConstFalse  -> return BoolType
    If t1 t2 t3 -> do
      typecheck store context (Typing t1 BoolType)
      typeOfThen <- typeOf store context t2
      typecheck store context (Typing t3 typeOfThen)
      return typeOfThen

    ConstZero -> return NatType
    Succ t -> do
      typecheck store context (Typing t NatType)
      return NatType
    Pred t -> do
      typecheck store context (Typing t NatType)
      return NatType
    IsZero t -> do
      typecheck store context (Typing t NatType)
      return BoolType

    Var x ->
      case lookup x context of
        Just actualType -> return actualType
        Nothing         -> undefinedVar expr

    Application t1 t2 -> do
      typeOfFun <- typeOf store context t1
      case typeOfFun of
        FunType typeOfArg typeOfResult -> do
          typecheck store context (Typing t2 typeOfArg)
          return typeOfResult
        actualType -> expectedFunType t1 actualType

    Abstraction x typeOfArg body -> do
      typeOfBody <- typeOf store ((x, typeOfArg) : context) body
      return (FunType typeOfArg typeOfBody)

    Assign l t -> do
      tyRef <- typeOf store context l
      case tyRef of
        RefType ty -> do
          typecheck store context (Typing t ty)
          return UnitType
        _      -> expectedRefType l tyRef

    Seq ts -> do
      case reverse ts of
        [] -> return UnitType
        e:es -> do
          mapM_ (typeOf store context) es
          typeOf store context e

    NewRef t -> do
      ty <- typeOf store context t
      return (RefType ty)

    DeRef t -> do
      ty <- typeOf store context t
      case ty of
        RefType ty' -> return ty'
        _           -> expectedRefType t ty

    ConstUnit -> return UnitType

    Location l ->
      case lookupLocationTyping l store of
        Just ty -> return ty
        Nothing -> undefinedLocation expr

lookupLocationTyping :: Integer -> StoreTyping -> Maybe Type
lookupLocationTyping l (StoreTyping types) = lookup l (map toPair types)
  where
    toPair (LocationTyping x ty) = (x, ty)
