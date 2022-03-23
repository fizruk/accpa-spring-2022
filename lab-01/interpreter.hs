{-# OPTIONS_GHC -Wall #-}
module Main where

import           Data.Coerce           (coerce)

import           Eval.Nameless
import qualified Syntax.Nameless.Abs   as Nameless
import           Syntax.Normal.Abs
import           Syntax.Normal.Par     (myLexer, pProgram)
-- import           Syntax.Normal.Print (printTree)
import           Syntax.Nameless.Print (printTree)

main :: IO ()
main = do
  input <- getContents
  case pProgram (myLexer input) of
    Left err   -> print err
    Right (ProgramExprs exprs) -> do
      mapM_ (putStrLn . printTree . eval . convert []) exprs

type Context = [Ident]

convert :: Context -> Expr -> Nameless.Expr
convert context expr =
  case expr of
    ConstTrue         -> Nameless.ConstTrue
    ConstFalse        -> Nameless.ConstFalse
    If t1 t2 t3       -> Nameless.If (convert context t1) (convert context t2) (convert context t3)

    ConstZero         -> Nameless.ConstZero
    Succ t            -> Nameless.Succ (convert context t)
    Pred t            -> Nameless.Pred (convert context t)
    IsZero t          -> Nameless.IsZero (convert context t)

    Var x             ->
      case elemIndex x context of
        Just n  -> Nameless.BoundVar n
        Nothing -> Nameless.FreeVar (coerce x)
    Abstraction x t   -> Nameless.Abstraction (convert (x:context) t)
    Application t1 t2 -> Nameless.Application (convert context t1) (convert context t2)

elemIndex :: Ident -> [Ident] -> Maybe Integer
elemIndex x [] = Nothing
elemIndex x (y:ys)
  | x == y = Just 0
  | otherwise =
      case elemIndex x ys of
        Just n  -> Just (n + 1)
        Nothing -> Nothing
