{-# OPTIONS_GHC -Wall #-}
module Main where

import           Eval
import           Syntax.Normal.Abs
import           Syntax.Normal.Par   (myLexer, pProgram)
import           Syntax.Normal.Print (printTree)
import           Typecheck

main :: IO ()
main = do
  input <- getContents
  case pProgram (myLexer input) of
    Left err   -> print err
    Right (ProgramExprs exprs) -> do
      mapM_ evalAndTypecheck exprs

evalAndTypecheck :: Expr -> IO ()
evalAndTypecheck expr = do
  case typeOf [] expr of
    Left err -> putStrLn err
    Right ty -> do
      putStrLn (printTree expr)
      putStrLn "has type"
      putStrLn (printTree ty)
      putStrLn "and evaluates to"
      putStrLn (printTree (eval expr))
  putStrLn ""
