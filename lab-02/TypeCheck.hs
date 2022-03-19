{-# OPTIONS_GHC -Wall -fno-warn-unused-do-bind #-}
module TypeCheck where

import           Syntax.Normal.Abs
import           Syntax.Normal.Print (printTree)

type Context = [(Ident, Type)]

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

typecheck :: Context -> Typing -> Either String Typing
typecheck context typing@(Typing expr expectedType) = do
  actualType <- typeOf context expr
  if actualType == expectedType
    then Right typing
    else typeMismatch typing actualType

typeOf :: Context -> Expr -> Either String Type
typeOf context expr =
  case expr of
    ConstTrue   -> return BoolType
    ConstFalse  -> return BoolType
    If t1 t2 t3 -> do
      typecheck context (Typing t1 BoolType)
      typeOfThen <- typeOf context t2
      typecheck context (Typing t3 typeOfThen)
      return typeOfThen

    ConstZero -> return NatType
    Succ t -> do
      typecheck context (Typing t NatType)
      return NatType
    Pred t -> do
      typecheck context (Typing t NatType)
      return NatType
    IsZero t -> do
      typecheck context (Typing t NatType)
      return BoolType

    Var x ->
      case lookup x context of
        Just actualType -> return actualType
        Nothing         -> undefinedVar expr

    Application t1 t2 -> do
      typeOfFun <- typeOf context t1
      case typeOfFun of
        FunType typeOfArg typeOfResult -> do
          typecheck context (Typing t2 typeOfArg)
          return typeOfResult
        actualType -> expectedFunType t1 actualType

    Abstraction x typeOfArg body -> do
      typeOfBody <- typeOf ((x, typeOfArg) : context) body
      return (FunType typeOfArg typeOfBody)
