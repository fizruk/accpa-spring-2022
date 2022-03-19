{-# LANGUAGE CPP #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
#if __GLASGOW_HASKELL__ <= 708
{-# LANGUAGE OverlappingInstances #-}
#endif

{-# OPTIONS_GHC -fno-warn-incomplete-patterns #-}

-- | Pretty-printer for Syntax.
--   Generated by the BNF converter.

module Syntax.Nameless.Print where

import Prelude
  ( ($), (.)
  , Bool(..), (==), (<)
  , Int, Integer, Double, (+), (-), (*)
  , String, (++)
  , ShowS, showChar, showString
  , all, dropWhile, elem, foldr, id, map, null, replicate, shows, span
  )
import Data.Char ( Char, isSpace )
import qualified Syntax.Nameless.Abs

-- | The top-level printing method.

printTree :: Print a => a -> String
printTree = render . prt 0

type Doc = [ShowS] -> [ShowS]

doc :: ShowS -> Doc
doc = (:)

render :: Doc -> String
render d = rend 0 (map ($ "") $ d []) "" where
  rend i = \case
    "["      :ts -> showChar '[' . rend i ts
    "("      :ts -> showChar '(' . rend i ts
    "{"      :ts -> showChar '{' . new (i+1) . rend (i+1) ts
    "}" : ";":ts -> new (i-1) . space "}" . showChar ';' . new (i-1) . rend (i-1) ts
    "}"      :ts -> new (i-1) . showChar '}' . new (i-1) . rend (i-1) ts
    [";"]        -> showChar ';'
    ";"      :ts -> showChar ';' . new i . rend i ts
    t  : ts@(p:_) | closingOrPunctuation p -> showString t . rend i ts
    t        :ts -> space t . rend i ts
    _            -> id
  new i     = showChar '\n' . replicateS (2*i) (showChar ' ') . dropWhile isSpace
  space t s =
    case (all isSpace t', null spc, null rest) of
      (True , _   , True ) -> []              -- remove trailing space
      (False, _   , True ) -> t'              -- remove trailing space
      (False, True, False) -> t' ++ ' ' : s   -- add space if none
      _                    -> t' ++ s
    where
      t'          = showString t []
      (spc, rest) = span isSpace s

  closingOrPunctuation :: String -> Bool
  closingOrPunctuation [c] = c `elem` closerOrPunct
  closingOrPunctuation _   = False

  closerOrPunct :: String
  closerOrPunct = ")],;"

parenth :: Doc -> Doc
parenth ss = doc (showChar '(') . ss . doc (showChar ')')

concatS :: [ShowS] -> ShowS
concatS = foldr (.) id

concatD :: [Doc] -> Doc
concatD = foldr (.) id

replicateS :: Int -> ShowS -> ShowS
replicateS n f = concatS (replicate n f)

-- | The printer class does the job.

class Print a where
  prt :: Int -> a -> Doc
  prtList :: Int -> [a] -> Doc
  prtList i = concatD . map (prt i)

instance {-# OVERLAPPABLE #-} Print a => Print [a] where
  prt = prtList

instance Print Char where
  prt     _ s = doc (showChar '\'' . mkEsc '\'' s . showChar '\'')
  prtList _ s = doc (showChar '"' . concatS (map (mkEsc '"') s) . showChar '"')

mkEsc :: Char -> Char -> ShowS
mkEsc q = \case
  s | s == q -> showChar '\\' . showChar s
  '\\' -> showString "\\\\"
  '\n' -> showString "\\n"
  '\t' -> showString "\\t"
  s -> showChar s

prPrec :: Int -> Int -> Doc -> Doc
prPrec i j = if j < i then parenth else id

instance Print Integer where
  prt _ x = doc (shows x)

instance Print Double where
  prt _ x = doc (shows x)

instance Print Syntax.Nameless.Abs.Ident where
  prt _ (Syntax.Nameless.Abs.Ident i) = doc $ showString i

instance Print Syntax.Nameless.Abs.Expr where
  prt i = \case
    Syntax.Nameless.Abs.ConstTrue -> prPrec i 0 (concatD [doc (showString "true")])
    Syntax.Nameless.Abs.ConstFalse -> prPrec i 0 (concatD [doc (showString "false")])
    Syntax.Nameless.Abs.If expr1 expr2 expr3 -> prPrec i 0 (concatD [doc (showString "if"), prt 0 expr1, doc (showString "then"), prt 0 expr2, doc (showString "else"), prt 0 expr3])
    Syntax.Nameless.Abs.ConstZero -> prPrec i 0 (concatD [doc (showString "0")])
    Syntax.Nameless.Abs.Succ expr -> prPrec i 0 (concatD [doc (showString "succ"), prt 0 expr])
    Syntax.Nameless.Abs.Pred expr -> prPrec i 0 (concatD [doc (showString "pred"), prt 0 expr])
    Syntax.Nameless.Abs.IsZero expr -> prPrec i 0 (concatD [doc (showString "iszero"), prt 0 expr])
    Syntax.Nameless.Abs.FreeVar id_ -> prPrec i 0 (concatD [prt 0 id_])
    Syntax.Nameless.Abs.BoundVar n -> prPrec i 0 (concatD [doc (showString "["), prt 0 n, doc (showString "]")])
    Syntax.Nameless.Abs.Abstraction expr -> prPrec i 0 (concatD [doc (showString "fun"), doc (showString "{"), doc (showString "return"), prt 0 expr, doc (showString "}")])
    Syntax.Nameless.Abs.Application expr1 expr2 -> prPrec i 0 (concatD [prt 0 expr1, prt 0 expr2])

