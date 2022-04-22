{-# LANGUAGE CPP #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE LambdaCase #-}
#if __GLASGOW_HASKELL__ <= 708
{-# LANGUAGE OverlappingInstances #-}
#endif

{-# OPTIONS_GHC -fno-warn-incomplete-patterns #-}

-- | Pretty-printer for Syntax.
--   Generated by the BNF converter.

module Syntax.Normal.Print where

import Prelude
  ( ($), (.)
  , Bool(..), (==), (<)
  , Int, Integer, Double, (+), (-), (*)
  , String, (++)
  , ShowS, showChar, showString
  , all, dropWhile, elem, foldr, id, map, null, replicate, shows, span
  )
import Data.Char ( Char, isSpace )
import qualified Syntax.Normal.Abs

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

instance Print Syntax.Normal.Abs.Ident where
  prt _ (Syntax.Normal.Abs.Ident i) = doc $ showString i

instance Print Syntax.Normal.Abs.Program where
  prt i = \case
    Syntax.Normal.Abs.ProgramExprs exprs -> prPrec i 0 (concatD [prt 0 exprs])

instance Print [Syntax.Normal.Abs.Expr] where
  prt = prtList

instance Print Syntax.Normal.Abs.Expr where
  prt i = \case
    Syntax.Normal.Abs.If expr1 expr2 expr3 -> prPrec i 0 (concatD [doc (showString "if"), prt 0 expr1, doc (showString "then"), prt 0 expr2, doc (showString "else"), prt 0 expr3])
    Syntax.Normal.Abs.Let id_ expr1 expr2 -> prPrec i 0 (concatD [doc (showString "let"), prt 0 id_, doc (showString "="), prt 0 expr1, doc (showString "in"), prt 0 expr2])
    Syntax.Normal.Abs.Abstraction id_ type_ expr -> prPrec i 0 (concatD [doc (showString "fun"), doc (showString "("), prt 0 id_, doc (showString ":"), prt 0 type_, doc (showString ")"), doc (showString "{"), doc (showString "return"), prt 0 expr, doc (showString "}")])
    Syntax.Normal.Abs.Record bindings -> prPrec i 0 (concatD [doc (showString "{"), prt 0 bindings, doc (showString "}")])
    Syntax.Normal.Abs.Variant id_ expr fieldtypes -> prPrec i 0 (concatD [doc (showString "<"), prt 0 id_, doc (showString "="), prt 0 expr, doc (showString ">"), doc (showString "as"), doc (showString "<"), prt 0 fieldtypes, doc (showString ">")])
    Syntax.Normal.Abs.Match expr matchcases -> prPrec i 0 (concatD [doc (showString "match"), prt 1 expr, doc (showString "{"), prt 0 matchcases, doc (showString "}")])
    Syntax.Normal.Abs.List exprs type_ -> prPrec i 0 (concatD [doc (showString "["), prt 0 exprs, doc (showString "]"), doc (showString "as"), doc (showString "["), prt 0 type_, doc (showString "]")])
    Syntax.Normal.Abs.Application expr1 expr2 -> prPrec i 1 (concatD [prt 1 expr1, prt 2 expr2])
    Syntax.Normal.Abs.ConsList expr1 expr2 -> prPrec i 2 (concatD [doc (showString "cons"), prt 3 expr1, prt 3 expr2])
    Syntax.Normal.Abs.Head expr -> prPrec i 2 (concatD [doc (showString "head"), prt 3 expr])
    Syntax.Normal.Abs.IsEmpty expr -> prPrec i 2 (concatD [doc (showString "isempty"), prt 3 expr])
    Syntax.Normal.Abs.Tail expr -> prPrec i 2 (concatD [doc (showString "tail"), prt 3 expr])
    Syntax.Normal.Abs.Succ expr -> prPrec i 2 (concatD [doc (showString "succ"), prt 3 expr])
    Syntax.Normal.Abs.Pred expr -> prPrec i 2 (concatD [doc (showString "pred"), prt 3 expr])
    Syntax.Normal.Abs.IsZero expr -> prPrec i 2 (concatD [doc (showString "iszero"), prt 3 expr])
    Syntax.Normal.Abs.Fix expr -> prPrec i 2 (concatD [doc (showString "fix"), prt 3 expr])
    Syntax.Normal.Abs.Fold type_ expr -> prPrec i 2 (concatD [doc (showString "fold"), doc (showString "["), prt 0 type_, doc (showString "]"), prt 3 expr])
    Syntax.Normal.Abs.Unfold type_ expr -> prPrec i 2 (concatD [doc (showString "unfold"), doc (showString "["), prt 0 type_, doc (showString "]"), prt 3 expr])
    Syntax.Normal.Abs.Dot expr id_ -> prPrec i 3 (concatD [prt 3 expr, doc (showString "."), prt 0 id_])
    Syntax.Normal.Abs.ConstTrue -> prPrec i 3 (concatD [doc (showString "true")])
    Syntax.Normal.Abs.ConstFalse -> prPrec i 3 (concatD [doc (showString "false")])
    Syntax.Normal.Abs.ConstZero -> prPrec i 3 (concatD [doc (showString "0")])
    Syntax.Normal.Abs.Var id_ -> prPrec i 3 (concatD [prt 0 id_])
  prtList _ [] = concatD []
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ";"), prt 0 xs]

instance Print Syntax.Normal.Abs.MatchCase where
  prt i = \case
    Syntax.Normal.Abs.MatchCase id_1 id_2 expr -> prPrec i 0 (concatD [doc (showString "<"), prt 0 id_1, doc (showString "="), prt 0 id_2, doc (showString ">"), doc (showString "=>"), prt 0 expr])
  prtList _ [] = concatD []
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ";"), prt 0 xs]

instance Print [Syntax.Normal.Abs.MatchCase] where
  prt = prtList

instance Print Syntax.Normal.Abs.Binding where
  prt i = \case
    Syntax.Normal.Abs.Binding id_ expr -> prPrec i 0 (concatD [prt 0 id_, doc (showString "="), prt 0 expr])
  prtList _ [] = concatD []
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print [Syntax.Normal.Abs.Binding] where
  prt = prtList

instance Print Syntax.Normal.Abs.Type where
  prt i = \case
    Syntax.Normal.Abs.FunType type_1 type_2 -> prPrec i 0 (concatD [prt 1 type_1, doc (showString "->"), prt 0 type_2])
    Syntax.Normal.Abs.RecType id_ type_ -> prPrec i 0 (concatD [doc (showString "\181"), prt 0 id_, doc (showString "."), prt 0 type_])
    Syntax.Normal.Abs.RecordType fieldtypes -> prPrec i 1 (concatD [doc (showString "{"), prt 0 fieldtypes, doc (showString "}")])
    Syntax.Normal.Abs.VariantType fieldtypes -> prPrec i 1 (concatD [doc (showString "<"), prt 0 fieldtypes, doc (showString ">")])
    Syntax.Normal.Abs.ListType type_ -> prPrec i 1 (concatD [doc (showString "["), prt 0 type_, doc (showString "]")])
    Syntax.Normal.Abs.BoolType -> prPrec i 2 (concatD [doc (showString "Bool")])
    Syntax.Normal.Abs.NatType -> prPrec i 2 (concatD [doc (showString "Nat")])
    Syntax.Normal.Abs.VarType id_ -> prPrec i 2 (concatD [prt 0 id_])

instance Print Syntax.Normal.Abs.FieldType where
  prt i = \case
    Syntax.Normal.Abs.FieldType id_ type_ -> prPrec i 0 (concatD [prt 0 id_, doc (showString ":"), prt 0 type_])
  prtList _ [] = concatD []
  prtList _ [x] = concatD [prt 0 x]
  prtList _ (x:xs) = concatD [prt 0 x, doc (showString ","), prt 0 xs]

instance Print [Syntax.Normal.Abs.FieldType] where
  prt = prtList

instance Print Syntax.Normal.Abs.Typing where
  prt i = \case
    Syntax.Normal.Abs.Typing expr type_ -> prPrec i 0 (concatD [prt 0 expr, doc (showString ":"), prt 0 type_])
