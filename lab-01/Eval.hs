{-# OPTIONS_GHC -Wall #-}
module Eval where

import           Convert
import qualified Eval.Nameless     as Nameless
import           Syntax.Normal.Abs

evalStep :: Expr -> Maybe Expr
evalStep expr =
  case Nameless.evalStep (toNameless_ expr) of
    Nothing    -> Nothing
    Just expr' -> Just (fromNameless_ expr')

evalSteps :: Expr -> [Expr]
evalSteps expr = expr :
  case evalStep expr of
    Nothing    -> []
    Just expr' -> evalSteps expr'

eval :: Expr -> Expr
eval = last . evalSteps
