{-# OPTIONS_GHC -Wall #-}
module Typecheck where

import           Syntax.Normal.Abs
import           Syntax.Normal.Print

type Context = [(Ident, Type)]

type TypeError = String

typeErrorExpectedFunType :: Expr -> Type -> TypeError
typeErrorExpectedFunType expr actualType = unlines
  [ "Type Error: expected function type"
  , "  but actual type is "
  , printTree actualType
  , "  for expression "
  , printTree expr
  ]

typeErrorExpected :: Type -> Expr -> Type -> TypeError
typeErrorExpected expectedType expr actualType = unlines
  [ "Type Error: expected type"
  , printTree expectedType
  , "  but actual type is "
  , printTree actualType
  , "  for expression "
  , printTree expr
  ]

typeErrorExpectedBool :: Expr -> Type -> TypeError
typeErrorExpectedBool = typeErrorExpected BoolType

typecheck :: Context -> Expr -> Type -> Either TypeError Type
typecheck context expr expectedType = do
  actualType <- typeOf context expr
  if expectedType == actualType
     then return actualType
     else Left (typeErrorExpected expectedType expr actualType)

typeOf :: Context -> Expr -> Either TypeError Type
typeOf context expr =
  case expr of
    ConstTrue  -> return BoolType
    ConstFalse -> return BoolType
    If t1 t2 t3 -> do
      typecheck context t1 BoolType
      typeOfResult <- typeOf context t2
      typecheck context t3 typeOfResult

    ConstZero -> return NatType
    Succ t -> do
      typecheck context t NatType
      return NatType
    Pred t -> do
      typecheck context t NatType
      return NatType
    IsZero t -> do
      typecheck context t NatType
      return BoolType

    Var x ->
      case lookup x context of
        Just typeOfX -> return typeOfX
        Nothing      -> Left ("undefined variable " <> printTree expr)

    Abstraction arg typeOfArg body -> do
      let newContext = (arg, typeOfArg) : context
      typeOfResult <- typeOf newContext body
      return (FunType typeOfArg typeOfResult)

    Application fun arg -> do
      typeOfFun <- typeOf context fun
      case typeOfFun of
        FunType typeOfArg typeOfResult -> do
          typecheck context arg typeOfArg
          return typeOfResult
        _ -> Left (typeErrorExpectedFunType expr typeOfFun)

