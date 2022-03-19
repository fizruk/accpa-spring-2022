{-# OPTIONS_GHC -Wall #-}
module Main where

import           Eval
import           Syntax.Normal.Abs   (Program (..))
import           Syntax.Normal.Par   (myLexer, pProgram)
import           Syntax.Normal.Print (printTree)

main :: IO ()
main = do
  input <- getContents
  case pProgram (myLexer input) of
    Left err   -> print err
    Right (ProgramExprs exprs) -> do
      mapM_ (putStrLn . printTree . eval) exprs
