{-# OPTIONS_GHC -Wall #-}
module Eval where

import           Convert
import qualified Eval.Nameless     as Nameless
import           Syntax.Normal.Abs
import           TypeCheck

evalStep :: (Expr, Store) -> Maybe (Expr, Store)
evalStep (expr, store) =
  case Nameless.evalStep (toNameless_ expr, toNamelessStore store) of
    Nothing    -> Nothing
    Just (expr', store') -> Just (fromNameless_ expr', fromNamelessStore store')

evalSteps :: (Expr, Store) -> [(Expr, Store)]
evalSteps expr = expr :
  case evalStep expr of
    Nothing    -> []
    Just expr' -> evalSteps expr'

eval :: (Expr, Store) -> (Expr, Store)
eval = last . evalSteps

eval_ :: Expr -> Expr
eval_ expr = fst (eval (expr, Store []))

typecheckAndEval :: Expr -> Either String Typing
typecheckAndEval expr = do
  ty <- typeOf (StoreTyping []) [] expr
  return (Typing (eval_ expr) ty)

