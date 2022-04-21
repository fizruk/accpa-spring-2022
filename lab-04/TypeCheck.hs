{-# OPTIONS_GHC -Wall -fno-warn-unused-do-bind #-}
module TypeCheck where

import           Data.Function       (on)
import           Data.List           (nubBy, (\\))
import           Syntax.Normal.Abs
import           Syntax.Normal.Print (printTree)

type Context = [(Ident, Type)]

errorMissingLabels :: [Ident] -> Expr -> Either String a
errorMissingLabels labels expr = Left $ unlines $ concat
  [ [ "the following cases" ]
  , map (\label -> "  " <> printTree label) labels
  , [ "are not matched in the expression"
    , " " <> printTree expr
    ] ]

errorUnexpectedLabels :: [Ident] -> Expr -> Either String a
errorUnexpectedLabels labels expr = Left $ unlines $ concat
  [ [ "the following cases" ]
  , map (\label -> "  " <> printTree label) labels
  , [ "are unexpected in the expression"
    , " " <> printTree expr
    ] ]

errorEmptyMatch :: Expr -> Either String a
errorEmptyMatch expr = Left $ unlines
  [ "illegal empty match"
  , " " <> printTree expr
  ]

expectedField :: Typing -> Ident -> Either String a
expectedField (Typing expr ty) x = Left $ unlines
  [ "expected field"
  , "  " <> printTree x
  , "which is missing in the type"
  , "  " <> printTree ty
  , "of the expression"
  , "  " <> printTree expr
  ]

expectedVariantType :: Expr -> Type -> Either String a
expectedVariantType expr actual = Left $ unlines
  [ "expected variant type"
  , "but actual type is"
  , "  " <> printTree actual
  , "for the expression"
  , "  " <> printTree expr
  ]

expectedListType :: Expr -> Type -> Either String a
expectedListType expr actual = Left $ unlines
  [ "expected list type"
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

expectedRecordType :: Expr -> Type -> Either String a
expectedRecordType expr actual = Left $ unlines
  [ "expected record type"
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

    Let x t1 t2 -> do
      typeOfX <- typeOf context t1
      typeOfResult <- typeOf ((x, typeOfX) : context) t2
      return typeOfResult

    Record fields -> do
      fieldTypes <- mapM typeOfField fields
      return (RecordType fieldTypes)

    Dot t x -> do
      ty <- typeOf context t
      case ty of
        RecordType fields ->
          case lookupFieldType x fields of
            Just typeOfX -> return typeOfX
            Nothing      -> expectedField (Typing t ty) x
        _ -> expectedRecordType t ty

    Variant l t tys -> do
      ty <- typeOf context t
      case lookupFieldType l tys of
        Nothing -> errorUnexpectedLabels [l] expr
        Just ty'
          | ty == ty' -> return ()
          | otherwise -> typeMismatch (Typing t ty') ty
      return (VariantType tys)

    Match t cases -> do
      ty <- typeOf context t
      case ty of
        VariantType caseTypes ->
          let expectedLabels = map (\(FieldType l _) -> l) caseTypes
              actualLabels   = map (\(MatchCase l _ _) -> l) cases
           in case expectedLabels \\ actualLabels of
                ls@(_:_) -> errorMissingLabels ls expr
                _ -> case actualLabels \\ expectedLabels of
                       ls@(_:_) -> errorUnexpectedLabels ls expr
                       _ -> do
                         typeOfResults <- mapM (typecheckCase caseTypes) cases
                         case nubBy ((==) `on` snd) typeOfResults of
                           []             -> errorEmptyMatch expr
                           [(_, typeOfResult)] -> return typeOfResult
                           (_, t1):(c, t2):_   -> typeMismatch (Typing c t2) t1
        _ -> expectedVariantType t ty

    List ts ty -> do
      mapM_ (\t -> typecheck context (Typing t ty)) ts
      return (ListType ty)

    ConsList t1 t2 -> do
      typeOfTail <- typeOf context t2
      case typeOfTail of
        ListType ty -> do
          typecheck context (Typing t1 ty)
          return (ListType ty)
        ty      -> expectedListType t2 ty

    Head t -> do
      typeOfList <- typeOf context t
      case typeOfList of
        ListType ty -> return ty
        ty          -> expectedListType t ty

    Tail t -> do
      typeOfList <- typeOf context t
      case typeOfList of
        ListType ty -> return (ListType ty)
        ty          -> expectedListType t ty

    IsEmpty t -> do
      typeOfList <- typeOf context t
      case typeOfList of
        ListType _ -> return BoolType
        ty         -> expectedListType t ty

    Fix t -> do
      ty <- typeOf context t
      case ty of
        FunType t1 t2
          | t1 == t2 -> return t1
          | otherwise -> typeMismatch (Typing t ty) (FunType t1 t1)
        _ -> expectedFunType t ty

  where
    typeOfField (Binding x t) = do
      ty <- typeOf context t
      return (FieldType x ty)

    typecheckCase tys (MatchCase l x t) = do
      case lookupFieldType l tys of
        Just ty -> do
          typeOfResult <- typeOf ((x, ty) : context) t
          return (t, typeOfResult)
        Nothing -> errorUnexpectedLabels [l] t

lookupFieldType :: Ident -> [FieldType] -> Maybe Type
lookupFieldType x fields = lookup x (map toPair fields)
  where
    toPair (FieldType z t) = (z, t)

