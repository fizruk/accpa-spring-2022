{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module Syntax.Normal.Par
  ( happyError
  , myLexer
  , pProgram
  , pListExpr
  , pExpr
  , pMatchCase
  , pListMatchCase
  , pBinding
  , pListBinding
  , pExpr1
  , pExpr2
  , pExpr3
  , pType
  , pType1
  , pType2
  , pFieldType
  , pListFieldType
  , pTyping
  ) where

import Prelude

import qualified Syntax.Normal.Abs
import Syntax.Normal.Lex
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

newtype HappyAbsSyn  = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
newtype HappyWrap19 = HappyWrap19 (Syntax.Normal.Abs.Ident)
happyIn19 :: (Syntax.Normal.Abs.Ident) -> (HappyAbsSyn )
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap19 x)
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn ) -> HappyWrap19
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
newtype HappyWrap20 = HappyWrap20 (Syntax.Normal.Abs.Program)
happyIn20 :: (Syntax.Normal.Abs.Program) -> (HappyAbsSyn )
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap20 x)
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn ) -> HappyWrap20
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
newtype HappyWrap21 = HappyWrap21 ([Syntax.Normal.Abs.Expr])
happyIn21 :: ([Syntax.Normal.Abs.Expr]) -> (HappyAbsSyn )
happyIn21 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap21 x)
{-# INLINE happyIn21 #-}
happyOut21 :: (HappyAbsSyn ) -> HappyWrap21
happyOut21 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut21 #-}
newtype HappyWrap22 = HappyWrap22 (Syntax.Normal.Abs.Expr)
happyIn22 :: (Syntax.Normal.Abs.Expr) -> (HappyAbsSyn )
happyIn22 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap22 x)
{-# INLINE happyIn22 #-}
happyOut22 :: (HappyAbsSyn ) -> HappyWrap22
happyOut22 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut22 #-}
newtype HappyWrap23 = HappyWrap23 (Syntax.Normal.Abs.MatchCase)
happyIn23 :: (Syntax.Normal.Abs.MatchCase) -> (HappyAbsSyn )
happyIn23 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap23 x)
{-# INLINE happyIn23 #-}
happyOut23 :: (HappyAbsSyn ) -> HappyWrap23
happyOut23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut23 #-}
newtype HappyWrap24 = HappyWrap24 ([Syntax.Normal.Abs.MatchCase])
happyIn24 :: ([Syntax.Normal.Abs.MatchCase]) -> (HappyAbsSyn )
happyIn24 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap24 x)
{-# INLINE happyIn24 #-}
happyOut24 :: (HappyAbsSyn ) -> HappyWrap24
happyOut24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut24 #-}
newtype HappyWrap25 = HappyWrap25 (Syntax.Normal.Abs.Binding)
happyIn25 :: (Syntax.Normal.Abs.Binding) -> (HappyAbsSyn )
happyIn25 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap25 x)
{-# INLINE happyIn25 #-}
happyOut25 :: (HappyAbsSyn ) -> HappyWrap25
happyOut25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut25 #-}
newtype HappyWrap26 = HappyWrap26 ([Syntax.Normal.Abs.Binding])
happyIn26 :: ([Syntax.Normal.Abs.Binding]) -> (HappyAbsSyn )
happyIn26 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap26 x)
{-# INLINE happyIn26 #-}
happyOut26 :: (HappyAbsSyn ) -> HappyWrap26
happyOut26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut26 #-}
newtype HappyWrap27 = HappyWrap27 (Syntax.Normal.Abs.Expr)
happyIn27 :: (Syntax.Normal.Abs.Expr) -> (HappyAbsSyn )
happyIn27 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap27 x)
{-# INLINE happyIn27 #-}
happyOut27 :: (HappyAbsSyn ) -> HappyWrap27
happyOut27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut27 #-}
newtype HappyWrap28 = HappyWrap28 (Syntax.Normal.Abs.Expr)
happyIn28 :: (Syntax.Normal.Abs.Expr) -> (HappyAbsSyn )
happyIn28 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap28 x)
{-# INLINE happyIn28 #-}
happyOut28 :: (HappyAbsSyn ) -> HappyWrap28
happyOut28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut28 #-}
newtype HappyWrap29 = HappyWrap29 (Syntax.Normal.Abs.Expr)
happyIn29 :: (Syntax.Normal.Abs.Expr) -> (HappyAbsSyn )
happyIn29 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap29 x)
{-# INLINE happyIn29 #-}
happyOut29 :: (HappyAbsSyn ) -> HappyWrap29
happyOut29 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut29 #-}
newtype HappyWrap30 = HappyWrap30 (Syntax.Normal.Abs.Type)
happyIn30 :: (Syntax.Normal.Abs.Type) -> (HappyAbsSyn )
happyIn30 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap30 x)
{-# INLINE happyIn30 #-}
happyOut30 :: (HappyAbsSyn ) -> HappyWrap30
happyOut30 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut30 #-}
newtype HappyWrap31 = HappyWrap31 (Syntax.Normal.Abs.Type)
happyIn31 :: (Syntax.Normal.Abs.Type) -> (HappyAbsSyn )
happyIn31 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap31 x)
{-# INLINE happyIn31 #-}
happyOut31 :: (HappyAbsSyn ) -> HappyWrap31
happyOut31 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut31 #-}
newtype HappyWrap32 = HappyWrap32 (Syntax.Normal.Abs.Type)
happyIn32 :: (Syntax.Normal.Abs.Type) -> (HappyAbsSyn )
happyIn32 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap32 x)
{-# INLINE happyIn32 #-}
happyOut32 :: (HappyAbsSyn ) -> HappyWrap32
happyOut32 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut32 #-}
newtype HappyWrap33 = HappyWrap33 (Syntax.Normal.Abs.FieldType)
happyIn33 :: (Syntax.Normal.Abs.FieldType) -> (HappyAbsSyn )
happyIn33 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap33 x)
{-# INLINE happyIn33 #-}
happyOut33 :: (HappyAbsSyn ) -> HappyWrap33
happyOut33 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut33 #-}
newtype HappyWrap34 = HappyWrap34 ([Syntax.Normal.Abs.FieldType])
happyIn34 :: ([Syntax.Normal.Abs.FieldType]) -> (HappyAbsSyn )
happyIn34 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap34 x)
{-# INLINE happyIn34 #-}
happyOut34 :: (HappyAbsSyn ) -> HappyWrap34
happyOut34 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut34 #-}
newtype HappyWrap35 = HappyWrap35 (Syntax.Normal.Abs.Typing)
happyIn35 :: (Syntax.Normal.Abs.Typing) -> (HappyAbsSyn )
happyIn35 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap35 x)
{-# INLINE happyIn35 #-}
happyOut35 :: (HappyAbsSyn ) -> HappyWrap35
happyOut35 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut35 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x00\x08\x09\xd2\xef\xdb\x09\x00\x00\x00\x00\x21\x41\xfa\x7d\x3b\x01\x00\x00\x00\x20\x24\x48\xbf\x6f\x27\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x40\x08\x80\x2e\xd3\x46\x00\x00\x00\x00\x08\x01\xd0\x65\xda\x08\x00\x00\x00\x00\x21\x00\x08\x00\x08\x01\x00\x00\x00\x20\x20\x0e\x00\x00\x34\x00\x00\x00\x00\x04\xc4\x01\x00\x80\x04\x00\x00\x00\x80\x00\x18\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x40\x48\x90\x7e\xdf\x4e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x80\x10\x00\x5d\xa6\x8d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x09\xd2\xef\xdb\x09\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x84\x04\xe9\xf7\xed\x04\x00\x00\x00\x80\x10\x00\x04\x00\x84\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x42\x00\x10\x00\x10\x02\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x21\x00\x08\x00\x08\x01\x00\x00\x00\x20\x24\x48\xbf\x6f\x27\x00\x00\x00\x00\x84\x00\x20\x00\x20\x04\x00\x00\x00\x80\x10\x00\x04\x00\x84\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x42\x00\x74\x99\x36\x02\x00\x00\x00\x40\x08\x00\x02\x00\x42\x00\x00\x00\x00\x08\x01\x40\x00\x40\x08\x00\x00\x00\x00\x21\x00\x08\x00\x08\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\xc4\x01\x00\x80\x06\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x01\x71\x00\x00\xa0\x01\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x01\xd0\x65\xda\x08\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x42\x82\xf4\xfb\x76\x02\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x20\x24\x48\xbf\x6f\x27\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x02\xe2\x00\x00\x40\x03\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x80\x80\x38\x00\x00\xd0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x02\xe2\x00\x00\x40\x03\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x20\x04\x40\x97\x69\x27\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x01\x71\x00\x00\xa0\x01\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\xc4\x00\x20\x00\x20\x04\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x40\x40\x1c\x00\x00\x68\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x24\x48\xbf\x6f\x27\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x40\x48\x90\x7e\xdf\x4e\x00\x00\x00\x00\x08\x09\xd2\xef\xdb\x09\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\xc4\x01\x00\x80\x06\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x10\x00\x04\x00\x84\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x08\x88\x03\x00\x00\x0d\x00\x00\x00\x00\x21\x00\x08\x00\x08\x01\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x10\x10\x07\x00\x00\x1a\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x09\xd2\xef\xdb\x09\x00\x00\x00\x00\x21\x41\xfa\x7d\x3b\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x10\x12\xa4\xdf\xb7\x13\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x48\x90\x7e\xdf\x4e\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pProgram","%start_pListExpr","%start_pExpr","%start_pMatchCase","%start_pListMatchCase","%start_pBinding","%start_pListBinding","%start_pExpr1","%start_pExpr2","%start_pExpr3","%start_pType","%start_pType1","%start_pType2","%start_pFieldType","%start_pListFieldType","%start_pTyping","Ident","Program","ListExpr","Expr","MatchCase","ListMatchCase","Binding","ListBinding","Expr1","Expr2","Expr3","Type","Type1","Type2","FieldType","ListFieldType","Typing","'('","')'","','","'->'","'.'","'0'","':'","';'","'<'","'='","'=>'","'>'","'Bool'","'Nat'","'['","']'","'as'","'cons'","'else'","'false'","'fix'","'fold'","'fun'","'head'","'if'","'in'","'isempty'","'iszero'","'let'","'match'","'pred'","'return'","'succ'","'tail'","'then'","'true'","'unfold'","'{'","'}'","'\181'","L_Ident","%eof"]
        bit_start = st Prelude.* 77
        bit_end = (st Prelude.+ 1) Prelude.* 77
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..76]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x1e\x00\x1e\x00\x1e\x00\xf8\xff\xf8\xff\xe1\xff\xe1\xff\x58\x00\x58\x00\x85\x00\x75\x00\x03\x00\x7a\x00\xe1\xff\xe1\xff\x1e\x00\xe1\xff\x00\x00\x00\x00\x17\x00\x58\x00\x00\x00\x08\x00\xf7\xff\x1e\x00\x00\x00\x1f\x00\x1e\x00\x85\x00\x00\x00\x85\x00\x20\x00\x30\x00\x85\x00\x1e\x00\x85\x00\x85\x00\x21\x00\x58\x00\x85\x00\x85\x00\x85\x00\x00\x00\x48\x00\x37\x00\x61\x00\x6c\x00\x4e\x00\x4e\x00\x00\x00\x4e\x00\x75\x00\x00\x00\x00\x00\x4e\x00\x00\x00\x57\x00\x75\x00\x57\x00\x66\x00\x8e\x00\x6e\x00\xfe\xff\x8a\x00\x01\x00\xc5\x00\xb9\x00\xa0\x00\xa0\x00\xc8\x00\xa8\x00\xaf\x00\xa9\x00\xa9\x00\xa9\x00\xd9\x00\xb5\x00\x00\x00\x1e\x00\xe6\x00\xec\x00\xd0\x00\x1e\x00\x00\x00\xd0\x00\x00\x01\x75\x00\xed\x00\x22\x01\x0b\x01\x24\x01\xfa\x00\x75\x00\x0e\x01\x75\x00\x36\x01\x36\x01\x36\x01\x40\x00\x37\x01\x3b\x01\x3b\x01\x2d\x01\x40\x01\x1b\x01\x75\x00\x54\x01\x84\x00\x4b\x01\x45\x01\x62\x01\x75\x00\x00\x00\x00\x00\x1e\x00\x56\x01\x60\x01\x58\x01\x5f\x01\x1e\x00\x1e\x00\x61\x01\x59\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x75\x00\x00\x00\x00\x00\x00\x00\x00\x00\x42\x01\x00\x00\x63\x01\x00\x00\x85\x00\x46\x01\x52\x01\x5b\x01\x75\x00\x85\x00\x64\x01\x65\x01\x66\x01\x75\x00\x6b\x01\x70\x01\x1e\x00\x1e\x00\x00\x00\x6f\x01\x6a\x01\x1e\x00\x00\x00\x00\x00\x50\x01\x68\x01\x71\x01\x53\x01\x00\x00\x5d\x01\x00\x00\x1e\x00\x6d\x01\x00\x00\x57\x01\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\xe5\x00\xe9\x00\x03\x01\x77\x01\x04\x00\x4b\x00\xb3\x00\x4a\x01\x45\x00\x05\x00\x9a\x00\x0e\x00\x0b\x00\x06\x00\x3e\x00\x8c\x00\x00\x00\x00\x00\x00\x00\x00\x00\xff\x00\x00\x00\x00\x00\x00\x00\x07\x01\x00\x00\x7f\x01\xf4\x00\x2e\x00\x00\x00\x49\x00\x00\x00\x00\x00\x50\x00\x12\x01\x5d\x00\x6b\x00\x80\x01\x55\x01\xe0\x00\x04\x01\x13\x01\x00\x00\x00\x00\x5a\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xa4\x00\x00\x00\x00\x00\x00\x00\x00\x00\x63\x00\xaa\x00\x7f\x00\x00\x00\x00\x00\x81\x01\x00\x00\x00\x00\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x82\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xf8\x00\x00\x00\xa7\x00\x5c\x01\x16\x01\x00\x00\x83\x01\x00\x00\xb2\x00\x00\x00\x00\x00\x00\x00\x00\x00\x91\x00\xb8\x00\x00\x00\xbb\x00\x00\x00\x00\x00\x00\x00\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x84\x01\xc0\x00\x00\x00\x18\x01\x00\x00\x00\x00\x00\x00\xc9\x00\x00\x00\x00\x00\x21\x01\x00\x00\x00\x00\x00\x00\x00\x00\x25\x01\x30\x01\xbd\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xce\x00\x00\x00\x00\x00\x00\x00\x00\x00\x85\x01\x00\x00\x00\x00\x00\x00\x27\x01\x00\x00\x00\x00\x00\x00\xd1\x00\x2c\x01\x00\x00\x00\x00\x00\x00\xd7\x00\x00\x00\x00\x00\x34\x01\x3f\x01\x00\x00\x00\x00\x00\x00\x43\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x93\x00\x00\x00\x00\x00\x00\x00\x4e\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\xed\xff\xed\xff\x00\x00\x00\x00\xe1\xff\x00\x00\xdd\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xbb\xff\x00\x00\x00\x00\xef\xff\xc9\xff\x00\x00\xe3\xff\xd9\xff\xce\xff\x00\x00\x00\x00\xca\xff\x00\x00\xed\xff\x00\x00\xcb\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xcc\xff\x00\x00\xdd\xff\x00\x00\xba\xff\x00\x00\x00\x00\xbe\xff\x00\x00\x00\x00\xc0\xff\xbf\xff\x00\x00\xc1\xff\xbb\xff\x00\x00\xbb\xff\x00\x00\xc5\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xdc\xff\x00\x00\x00\x00\xe0\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xec\xff\x00\x00\xee\xff\xed\xff\x00\x00\xe1\xff\xdd\xff\x00\x00\xda\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xbb\xff\x00\x00\x00\x00\x00\x00\xd5\xff\xd4\xff\xd3\xff\x00\x00\x00\x00\xd2\xff\xd6\xff\x00\x00\xd7\xff\x00\x00\x00\x00\xd1\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb8\xff\xc8\xff\x00\x00\x00\x00\xd8\xff\x00\x00\x00\x00\x00\x00\x00\x00\xe1\xff\x00\x00\xe7\xff\xbc\xff\xb9\xff\xbd\xff\xc3\xff\xc2\xff\xc4\xff\xc7\xff\x00\x00\xcd\xff\xde\xff\xdb\xff\xdf\xff\x00\x00\xeb\xff\x00\x00\xc6\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd0\xff\x00\x00\x00\x00\x00\x00\xe5\xff\xcf\xff\x00\x00\x00\x00\xe9\xff\xea\xff\x00\x00\x00\x00\x00\x00\xbb\xff\xe4\xff\x00\x00\xe2\xff\x00\x00\x00\x00\xe6\xff\x00\x00\xe8\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x09\x00\x01\x00\x05\x00\x01\x00\x00\x00\x00\x00\x06\x00\x04\x00\x05\x00\x29\x00\x00\x00\x09\x00\x05\x00\x00\x00\x0a\x00\x0d\x00\x0e\x00\x0f\x00\x12\x00\x0e\x00\x14\x00\x15\x00\x16\x00\x0d\x00\x18\x00\x0c\x00\x0d\x00\x1b\x00\x1c\x00\x07\x00\x01\x00\x1f\x00\x2a\x00\x21\x00\x22\x00\x06\x00\x24\x00\x25\x00\x09\x00\x2a\x00\x26\x00\x29\x00\x2a\x00\x29\x00\x0f\x00\x00\x00\x0f\x00\x12\x00\x01\x00\x14\x00\x15\x00\x16\x00\x17\x00\x18\x00\x19\x00\x0a\x00\x1b\x00\x1c\x00\x1d\x00\x1e\x00\x1f\x00\x00\x00\x21\x00\x22\x00\x01\x00\x24\x00\x25\x00\x26\x00\x00\x00\x06\x00\x29\x00\x29\x00\x00\x00\x29\x00\x00\x00\x0e\x00\x0f\x00\x09\x00\x0a\x00\x00\x00\x06\x00\x12\x00\x0a\x00\x14\x00\x15\x00\x16\x00\x0f\x00\x18\x00\x01\x00\x0a\x00\x1b\x00\x1c\x00\x00\x00\x06\x00\x1f\x00\x29\x00\x21\x00\x22\x00\x00\x00\x24\x00\x25\x00\x26\x00\x0a\x00\x07\x00\x29\x00\x12\x00\x00\x00\x14\x00\x15\x00\x16\x00\x03\x00\x18\x00\x0e\x00\x0f\x00\x1b\x00\x1c\x00\x0a\x00\x01\x00\x1f\x00\x2a\x00\x21\x00\x22\x00\x01\x00\x24\x00\x25\x00\x09\x00\x00\x00\x29\x00\x29\x00\x0d\x00\x0e\x00\x0f\x00\x01\x00\x01\x00\x0d\x00\x0e\x00\x05\x00\x06\x00\x06\x00\x00\x00\x0e\x00\x0f\x00\x03\x00\x2a\x00\x00\x00\x04\x00\x00\x00\x08\x00\x09\x00\x0a\x00\x29\x00\x14\x00\x14\x00\x00\x00\x26\x00\x10\x00\x28\x00\x29\x00\x0e\x00\x0f\x00\x0e\x00\x0f\x00\x29\x00\x00\x00\x0b\x00\x0c\x00\x0d\x00\x24\x00\x24\x00\x00\x00\x04\x00\x05\x00\x29\x00\x29\x00\x0b\x00\x0c\x00\x0d\x00\x00\x00\x00\x00\x2a\x00\x0b\x00\x0c\x00\x0d\x00\x00\x00\x06\x00\x07\x00\x00\x00\x03\x00\x0b\x00\x0c\x00\x0d\x00\x00\x00\x04\x00\x05\x00\x0b\x00\x0c\x00\x0d\x00\x0b\x00\x0c\x00\x0d\x00\x00\x00\x2a\x00\x0b\x00\x0c\x00\x0d\x00\x00\x00\x0a\x00\x08\x00\x00\x00\x2a\x00\x2a\x00\x0b\x00\x0c\x00\x0d\x00\x00\x00\x29\x00\x0b\x00\x0c\x00\x0d\x00\x0b\x00\x0c\x00\x0d\x00\x2a\x00\x00\x00\x08\x00\x0b\x00\x0c\x00\x0d\x00\x00\x00\x01\x00\x02\x00\x03\x00\x00\x00\x0a\x00\x02\x00\x03\x00\x08\x00\x09\x00\x0a\x00\x0a\x00\x08\x00\x09\x00\x0a\x00\x00\x00\x09\x00\x02\x00\x03\x00\x00\x00\x29\x00\x02\x00\x03\x00\x08\x00\x09\x00\x0a\x00\x00\x00\x08\x00\x09\x00\x0a\x00\x00\x00\x00\x00\x05\x00\x03\x00\x00\x00\x09\x00\x0a\x00\x03\x00\x08\x00\x09\x00\x0a\x00\x0a\x00\x08\x00\x09\x00\x0a\x00\x00\x00\x00\x00\x27\x00\x03\x00\x00\x00\x0c\x00\x00\x00\x03\x00\x08\x00\x09\x00\x0a\x00\x0a\x00\x08\x00\x09\x00\x0a\x00\x00\x00\x0a\x00\x29\x00\x03\x00\x00\x00\x02\x00\x00\x00\x03\x00\x08\x00\x09\x00\x0a\x00\x00\x00\x08\x00\x09\x00\x0a\x00\x00\x00\x0a\x00\x10\x00\x03\x00\x00\x00\x27\x00\x0a\x00\x03\x00\x08\x00\x09\x00\x0a\x00\x05\x00\x08\x00\x09\x00\x0a\x00\x00\x00\x05\x00\x0a\x00\x03\x00\x00\x00\x29\x00\x05\x00\x03\x00\x08\x00\x09\x00\x0a\x00\x00\x00\x08\x00\x09\x00\x0a\x00\x00\x00\x0a\x00\x23\x00\x03\x00\x08\x00\x09\x00\x0a\x00\x00\x00\x08\x00\x09\x00\x0a\x00\x05\x00\x00\x00\x10\x00\x00\x00\x08\x00\x09\x00\x0a\x00\x06\x00\x07\x00\x06\x00\x07\x00\x02\x00\x05\x00\x07\x00\x11\x00\x10\x00\x10\x00\x09\x00\x29\x00\x1a\x00\x27\x00\x13\x00\x0c\x00\x05\x00\x0c\x00\x02\x00\x0f\x00\x05\x00\x0b\x00\x26\x00\x11\x00\x10\x00\x0c\x00\x09\x00\x04\x00\x29\x00\x20\x00\x27\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x48\x00\x19\x00\x55\x00\x34\x00\x12\x00\x2d\x00\x1a\x00\x45\x00\x46\x00\x12\x00\x31\x00\x39\x00\x55\x00\x31\x00\x3e\x00\x35\x00\x36\x00\x3a\x00\x1d\x00\x30\x00\x1e\x00\x1f\x00\x20\x00\x32\x00\x22\x00\x36\x00\x37\x00\x24\x00\x25\x00\x70\x00\x19\x00\x28\x00\xff\xff\x29\x00\x2a\x00\x1a\x00\x2b\x00\x2c\x00\x1b\x00\xff\xff\x3b\x00\x12\x00\xff\xff\x12\x00\x1c\x00\x12\x00\x6a\x00\x1d\x00\x69\x00\x1e\x00\x1f\x00\x20\x00\x21\x00\x22\x00\x23\x00\x6b\x00\x24\x00\x25\x00\x26\x00\x27\x00\x28\x00\x2d\x00\x29\x00\x2a\x00\x19\x00\x2b\x00\x2c\x00\x2d\x00\x12\x00\x1a\x00\x12\x00\x12\x00\x12\x00\x12\x00\x41\x00\x2e\x00\x2f\x00\x3f\x00\x16\x00\x12\x00\x44\x00\x1d\x00\x6a\x00\x1e\x00\x1f\x00\x20\x00\x5f\x00\x22\x00\x19\x00\x67\x00\x24\x00\x25\x00\x12\x00\x1a\x00\x28\x00\x12\x00\x29\x00\x2a\x00\x2d\x00\x2b\x00\x2c\x00\x7a\x00\x65\x00\x5d\x00\x12\x00\x1d\x00\x12\x00\x1e\x00\x1f\x00\x20\x00\x5c\x00\x22\x00\x2e\x00\x59\x00\x24\x00\x25\x00\x64\x00\x34\x00\x28\x00\xff\xff\x29\x00\x2a\x00\x34\x00\x2b\x00\x2c\x00\x39\x00\x2d\x00\x12\x00\x12\x00\x35\x00\x36\x00\x3a\x00\x19\x00\x19\x00\x35\x00\x36\x00\x55\x00\x1a\x00\x1a\x00\x12\x00\x2e\x00\x57\x00\x13\x00\xff\xff\x2d\x00\x57\x00\x2d\x00\x14\x00\x15\x00\x16\x00\x12\x00\x1e\x00\x1e\x00\x31\x00\x3b\x00\x17\x00\x3e\x00\x12\x00\x2e\x00\x7d\x00\x2e\x00\xa8\x00\x12\x00\x31\x00\x3b\x00\x3c\x00\x37\x00\x2b\x00\x2b\x00\x31\x00\x45\x00\x87\x00\x12\x00\x12\x00\x5a\x00\x3c\x00\x37\x00\x31\x00\x41\x00\xff\xff\x58\x00\x3c\x00\x37\x00\x31\x00\x42\x00\x43\x00\x31\x00\x52\x00\x82\x00\x3c\x00\x37\x00\x31\x00\x45\x00\x8d\x00\x7c\x00\x3c\x00\x37\x00\x7a\x00\x3c\x00\x37\x00\x31\x00\xff\xff\x75\x00\x3c\x00\x37\x00\x31\x00\x53\x00\x51\x00\x31\x00\xff\xff\xff\xff\x70\x00\x3c\x00\x37\x00\x31\x00\x12\x00\x8b\x00\x3c\x00\x37\x00\x97\x00\x3c\x00\x37\x00\xff\xff\x12\x00\x4f\x00\xa1\x00\x3c\x00\x37\x00\x12\x00\x4c\x00\x4d\x00\x4b\x00\x12\x00\x61\x00\x4a\x00\x4b\x00\x14\x00\x15\x00\x16\x00\x89\x00\x14\x00\x15\x00\x16\x00\x12\x00\x48\x00\x6c\x00\x4b\x00\x12\x00\x12\x00\x89\x00\x4b\x00\x14\x00\x15\x00\x16\x00\x12\x00\x14\x00\x15\x00\x16\x00\x12\x00\x12\x00\x84\x00\x49\x00\x12\x00\x53\x00\x16\x00\x6e\x00\x14\x00\x15\x00\x16\x00\x60\x00\x14\x00\x15\x00\x16\x00\x12\x00\x12\x00\x82\x00\x66\x00\x12\x00\x80\x00\x12\x00\x85\x00\x14\x00\x15\x00\x16\x00\x5f\x00\x14\x00\x15\x00\x16\x00\x12\x00\x74\x00\x12\x00\x93\x00\x12\x00\x7f\x00\x12\x00\x8f\x00\x14\x00\x15\x00\x16\x00\x12\x00\x14\x00\x15\x00\x16\x00\x12\x00\x9b\x00\x81\x00\x8e\x00\x12\x00\x7c\x00\x96\x00\x9f\x00\x14\x00\x15\x00\x16\x00\x55\x00\x14\x00\x15\x00\x16\x00\x12\x00\x55\x00\x79\x00\x9e\x00\x12\x00\x12\x00\x55\x00\xa6\x00\x14\x00\x15\x00\x16\x00\x12\x00\x14\x00\x15\x00\x16\x00\x12\x00\x73\x00\x78\x00\xaa\x00\x40\x00\x15\x00\x16\x00\x12\x00\x14\x00\x15\x00\x16\x00\x55\x00\x41\x00\x74\x00\x41\x00\x62\x00\x15\x00\x16\x00\x42\x00\x5d\x00\x42\x00\x86\x00\x72\x00\x55\x00\x91\x00\x93\x00\x92\x00\x8d\x00\x48\x00\x12\x00\x9a\x00\x9b\x00\x99\x00\x9d\x00\x55\x00\x95\x00\xa1\x00\x96\x00\x55\x00\x9e\x00\xa6\x00\xa3\x00\xa5\x00\xaa\x00\xa4\x00\x48\x00\x12\x00\xa8\x00\xac\x00\x6d\x00\x63\x00\x55\x00\x4f\x00\x84\x00\x76\x00\x8a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (16, 71) [
	(16 , happyReduce_16),
	(17 , happyReduce_17),
	(18 , happyReduce_18),
	(19 , happyReduce_19),
	(20 , happyReduce_20),
	(21 , happyReduce_21),
	(22 , happyReduce_22),
	(23 , happyReduce_23),
	(24 , happyReduce_24),
	(25 , happyReduce_25),
	(26 , happyReduce_26),
	(27 , happyReduce_27),
	(28 , happyReduce_28),
	(29 , happyReduce_29),
	(30 , happyReduce_30),
	(31 , happyReduce_31),
	(32 , happyReduce_32),
	(33 , happyReduce_33),
	(34 , happyReduce_34),
	(35 , happyReduce_35),
	(36 , happyReduce_36),
	(37 , happyReduce_37),
	(38 , happyReduce_38),
	(39 , happyReduce_39),
	(40 , happyReduce_40),
	(41 , happyReduce_41),
	(42 , happyReduce_42),
	(43 , happyReduce_43),
	(44 , happyReduce_44),
	(45 , happyReduce_45),
	(46 , happyReduce_46),
	(47 , happyReduce_47),
	(48 , happyReduce_48),
	(49 , happyReduce_49),
	(50 , happyReduce_50),
	(51 , happyReduce_51),
	(52 , happyReduce_52),
	(53 , happyReduce_53),
	(54 , happyReduce_54),
	(55 , happyReduce_55),
	(56 , happyReduce_56),
	(57 , happyReduce_57),
	(58 , happyReduce_58),
	(59 , happyReduce_59),
	(60 , happyReduce_60),
	(61 , happyReduce_61),
	(62 , happyReduce_62),
	(63 , happyReduce_63),
	(64 , happyReduce_64),
	(65 , happyReduce_65),
	(66 , happyReduce_66),
	(67 , happyReduce_67),
	(68 , happyReduce_68),
	(69 , happyReduce_69),
	(70 , happyReduce_70),
	(71 , happyReduce_71)
	]

happy_n_terms = 43 :: Prelude.Int
happy_n_nonterms = 17 :: Prelude.Int

happyReduce_16 = happySpecReduce_1  0# happyReduction_16
happyReduction_16 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TV happy_var_1)) -> 
	happyIn19
		 (Syntax.Normal.Abs.Ident happy_var_1
	)}

happyReduce_17 = happySpecReduce_1  1# happyReduction_17
happyReduction_17 happy_x_1
	 =  case happyOut21 happy_x_1 of { (HappyWrap21 happy_var_1) -> 
	happyIn20
		 (Syntax.Normal.Abs.ProgramExprs happy_var_1
	)}

happyReduce_18 = happySpecReduce_0  2# happyReduction_18
happyReduction_18  =  happyIn21
		 ([]
	)

happyReduce_19 = happySpecReduce_1  2# happyReduction_19
happyReduction_19 happy_x_1
	 =  case happyOut22 happy_x_1 of { (HappyWrap22 happy_var_1) -> 
	happyIn21
		 ((:[]) happy_var_1
	)}

happyReduce_20 = happySpecReduce_3  2# happyReduction_20
happyReduction_20 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut22 happy_x_1 of { (HappyWrap22 happy_var_1) -> 
	case happyOut21 happy_x_3 of { (HappyWrap21 happy_var_3) -> 
	happyIn21
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_21 = happyReduce 6# 3# happyReduction_21
happyReduction_21 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut22 happy_x_2 of { (HappyWrap22 happy_var_2) -> 
	case happyOut22 happy_x_4 of { (HappyWrap22 happy_var_4) -> 
	case happyOut22 happy_x_6 of { (HappyWrap22 happy_var_6) -> 
	happyIn22
		 (Syntax.Normal.Abs.If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_22 = happyReduce 6# 3# happyReduction_22
happyReduction_22 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut19 happy_x_2 of { (HappyWrap19 happy_var_2) -> 
	case happyOut22 happy_x_4 of { (HappyWrap22 happy_var_4) -> 
	case happyOut22 happy_x_6 of { (HappyWrap22 happy_var_6) -> 
	happyIn22
		 (Syntax.Normal.Abs.Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_23 = happyReduce 10# 3# happyReduction_23
happyReduction_23 (happy_x_10 `HappyStk`
	happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut19 happy_x_3 of { (HappyWrap19 happy_var_3) -> 
	case happyOut30 happy_x_5 of { (HappyWrap30 happy_var_5) -> 
	case happyOut22 happy_x_9 of { (HappyWrap22 happy_var_9) -> 
	happyIn22
		 (Syntax.Normal.Abs.Abstraction happy_var_3 happy_var_5 happy_var_9
	) `HappyStk` happyRest}}}

happyReduce_24 = happySpecReduce_3  3# happyReduction_24
happyReduction_24 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut26 happy_x_2 of { (HappyWrap26 happy_var_2) -> 
	happyIn22
		 (Syntax.Normal.Abs.Record happy_var_2
	)}

happyReduce_25 = happyReduce 9# 3# happyReduction_25
happyReduction_25 (happy_x_9 `HappyStk`
	happy_x_8 `HappyStk`
	happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut19 happy_x_2 of { (HappyWrap19 happy_var_2) -> 
	case happyOut22 happy_x_4 of { (HappyWrap22 happy_var_4) -> 
	case happyOut34 happy_x_8 of { (HappyWrap34 happy_var_8) -> 
	happyIn22
		 (Syntax.Normal.Abs.Variant happy_var_2 happy_var_4 happy_var_8
	) `HappyStk` happyRest}}}

happyReduce_26 = happyReduce 5# 3# happyReduction_26
happyReduction_26 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut27 happy_x_2 of { (HappyWrap27 happy_var_2) -> 
	case happyOut24 happy_x_4 of { (HappyWrap24 happy_var_4) -> 
	happyIn22
		 (Syntax.Normal.Abs.Match happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_27 = happyReduce 7# 3# happyReduction_27
happyReduction_27 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut21 happy_x_2 of { (HappyWrap21 happy_var_2) -> 
	case happyOut30 happy_x_6 of { (HappyWrap30 happy_var_6) -> 
	happyIn22
		 (Syntax.Normal.Abs.List happy_var_2 happy_var_6
	) `HappyStk` happyRest}}

happyReduce_28 = happySpecReduce_1  3# happyReduction_28
happyReduction_28 happy_x_1
	 =  case happyOut27 happy_x_1 of { (HappyWrap27 happy_var_1) -> 
	happyIn22
		 (happy_var_1
	)}

happyReduce_29 = happyReduce 7# 4# happyReduction_29
happyReduction_29 (happy_x_7 `HappyStk`
	happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut19 happy_x_2 of { (HappyWrap19 happy_var_2) -> 
	case happyOut19 happy_x_4 of { (HappyWrap19 happy_var_4) -> 
	case happyOut22 happy_x_7 of { (HappyWrap22 happy_var_7) -> 
	happyIn23
		 (Syntax.Normal.Abs.MatchCase happy_var_2 happy_var_4 happy_var_7
	) `HappyStk` happyRest}}}

happyReduce_30 = happySpecReduce_0  5# happyReduction_30
happyReduction_30  =  happyIn24
		 ([]
	)

happyReduce_31 = happySpecReduce_1  5# happyReduction_31
happyReduction_31 happy_x_1
	 =  case happyOut23 happy_x_1 of { (HappyWrap23 happy_var_1) -> 
	happyIn24
		 ((:[]) happy_var_1
	)}

happyReduce_32 = happySpecReduce_3  5# happyReduction_32
happyReduction_32 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut23 happy_x_1 of { (HappyWrap23 happy_var_1) -> 
	case happyOut24 happy_x_3 of { (HappyWrap24 happy_var_3) -> 
	happyIn24
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_33 = happySpecReduce_3  6# happyReduction_33
happyReduction_33 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	case happyOut22 happy_x_3 of { (HappyWrap22 happy_var_3) -> 
	happyIn25
		 (Syntax.Normal.Abs.Binding happy_var_1 happy_var_3
	)}}

happyReduce_34 = happySpecReduce_0  7# happyReduction_34
happyReduction_34  =  happyIn26
		 ([]
	)

happyReduce_35 = happySpecReduce_1  7# happyReduction_35
happyReduction_35 happy_x_1
	 =  case happyOut25 happy_x_1 of { (HappyWrap25 happy_var_1) -> 
	happyIn26
		 ((:[]) happy_var_1
	)}

happyReduce_36 = happySpecReduce_3  7# happyReduction_36
happyReduction_36 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut25 happy_x_1 of { (HappyWrap25 happy_var_1) -> 
	case happyOut26 happy_x_3 of { (HappyWrap26 happy_var_3) -> 
	happyIn26
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_37 = happySpecReduce_2  8# happyReduction_37
happyReduction_37 happy_x_2
	happy_x_1
	 =  case happyOut27 happy_x_1 of { (HappyWrap27 happy_var_1) -> 
	case happyOut28 happy_x_2 of { (HappyWrap28 happy_var_2) -> 
	happyIn27
		 (Syntax.Normal.Abs.Application happy_var_1 happy_var_2
	)}}

happyReduce_38 = happySpecReduce_1  8# happyReduction_38
happyReduction_38 happy_x_1
	 =  case happyOut28 happy_x_1 of { (HappyWrap28 happy_var_1) -> 
	happyIn27
		 (happy_var_1
	)}

happyReduce_39 = happySpecReduce_3  9# happyReduction_39
happyReduction_39 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_2 of { (HappyWrap29 happy_var_2) -> 
	case happyOut29 happy_x_3 of { (HappyWrap29 happy_var_3) -> 
	happyIn28
		 (Syntax.Normal.Abs.ConsList happy_var_2 happy_var_3
	)}}

happyReduce_40 = happySpecReduce_2  9# happyReduction_40
happyReduction_40 happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_2 of { (HappyWrap29 happy_var_2) -> 
	happyIn28
		 (Syntax.Normal.Abs.Head happy_var_2
	)}

happyReduce_41 = happySpecReduce_2  9# happyReduction_41
happyReduction_41 happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_2 of { (HappyWrap29 happy_var_2) -> 
	happyIn28
		 (Syntax.Normal.Abs.IsEmpty happy_var_2
	)}

happyReduce_42 = happySpecReduce_2  9# happyReduction_42
happyReduction_42 happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_2 of { (HappyWrap29 happy_var_2) -> 
	happyIn28
		 (Syntax.Normal.Abs.Tail happy_var_2
	)}

happyReduce_43 = happySpecReduce_2  9# happyReduction_43
happyReduction_43 happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_2 of { (HappyWrap29 happy_var_2) -> 
	happyIn28
		 (Syntax.Normal.Abs.Succ happy_var_2
	)}

happyReduce_44 = happySpecReduce_2  9# happyReduction_44
happyReduction_44 happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_2 of { (HappyWrap29 happy_var_2) -> 
	happyIn28
		 (Syntax.Normal.Abs.Pred happy_var_2
	)}

happyReduce_45 = happySpecReduce_2  9# happyReduction_45
happyReduction_45 happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_2 of { (HappyWrap29 happy_var_2) -> 
	happyIn28
		 (Syntax.Normal.Abs.IsZero happy_var_2
	)}

happyReduce_46 = happySpecReduce_2  9# happyReduction_46
happyReduction_46 happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_2 of { (HappyWrap29 happy_var_2) -> 
	happyIn28
		 (Syntax.Normal.Abs.Fix happy_var_2
	)}

happyReduce_47 = happyReduce 5# 9# happyReduction_47
happyReduction_47 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut30 happy_x_3 of { (HappyWrap30 happy_var_3) -> 
	case happyOut29 happy_x_5 of { (HappyWrap29 happy_var_5) -> 
	happyIn28
		 (Syntax.Normal.Abs.Fold happy_var_3 happy_var_5
	) `HappyStk` happyRest}}

happyReduce_48 = happyReduce 5# 9# happyReduction_48
happyReduction_48 (happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut30 happy_x_3 of { (HappyWrap30 happy_var_3) -> 
	case happyOut29 happy_x_5 of { (HappyWrap29 happy_var_5) -> 
	happyIn28
		 (Syntax.Normal.Abs.Unfold happy_var_3 happy_var_5
	) `HappyStk` happyRest}}

happyReduce_49 = happySpecReduce_1  9# happyReduction_49
happyReduction_49 happy_x_1
	 =  case happyOut29 happy_x_1 of { (HappyWrap29 happy_var_1) -> 
	happyIn28
		 (happy_var_1
	)}

happyReduce_50 = happySpecReduce_3  10# happyReduction_50
happyReduction_50 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut29 happy_x_1 of { (HappyWrap29 happy_var_1) -> 
	case happyOut19 happy_x_3 of { (HappyWrap19 happy_var_3) -> 
	happyIn29
		 (Syntax.Normal.Abs.Dot happy_var_1 happy_var_3
	)}}

happyReduce_51 = happySpecReduce_1  10# happyReduction_51
happyReduction_51 happy_x_1
	 =  happyIn29
		 (Syntax.Normal.Abs.ConstTrue
	)

happyReduce_52 = happySpecReduce_1  10# happyReduction_52
happyReduction_52 happy_x_1
	 =  happyIn29
		 (Syntax.Normal.Abs.ConstFalse
	)

happyReduce_53 = happySpecReduce_1  10# happyReduction_53
happyReduction_53 happy_x_1
	 =  happyIn29
		 (Syntax.Normal.Abs.ConstZero
	)

happyReduce_54 = happySpecReduce_1  10# happyReduction_54
happyReduction_54 happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	happyIn29
		 (Syntax.Normal.Abs.Var happy_var_1
	)}

happyReduce_55 = happySpecReduce_3  10# happyReduction_55
happyReduction_55 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut22 happy_x_2 of { (HappyWrap22 happy_var_2) -> 
	happyIn29
		 (happy_var_2
	)}

happyReduce_56 = happySpecReduce_3  11# happyReduction_56
happyReduction_56 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut31 happy_x_1 of { (HappyWrap31 happy_var_1) -> 
	case happyOut30 happy_x_3 of { (HappyWrap30 happy_var_3) -> 
	happyIn30
		 (Syntax.Normal.Abs.FunType happy_var_1 happy_var_3
	)}}

happyReduce_57 = happyReduce 4# 11# happyReduction_57
happyReduction_57 (happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut19 happy_x_2 of { (HappyWrap19 happy_var_2) -> 
	case happyOut30 happy_x_4 of { (HappyWrap30 happy_var_4) -> 
	happyIn30
		 (Syntax.Normal.Abs.RecType happy_var_2 happy_var_4
	) `HappyStk` happyRest}}

happyReduce_58 = happySpecReduce_1  11# happyReduction_58
happyReduction_58 happy_x_1
	 =  case happyOut31 happy_x_1 of { (HappyWrap31 happy_var_1) -> 
	happyIn30
		 (happy_var_1
	)}

happyReduce_59 = happySpecReduce_3  12# happyReduction_59
happyReduction_59 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut34 happy_x_2 of { (HappyWrap34 happy_var_2) -> 
	happyIn31
		 (Syntax.Normal.Abs.RecordType happy_var_2
	)}

happyReduce_60 = happySpecReduce_3  12# happyReduction_60
happyReduction_60 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut34 happy_x_2 of { (HappyWrap34 happy_var_2) -> 
	happyIn31
		 (Syntax.Normal.Abs.VariantType happy_var_2
	)}

happyReduce_61 = happySpecReduce_3  12# happyReduction_61
happyReduction_61 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_2 of { (HappyWrap30 happy_var_2) -> 
	happyIn31
		 (Syntax.Normal.Abs.ListType happy_var_2
	)}

happyReduce_62 = happySpecReduce_1  12# happyReduction_62
happyReduction_62 happy_x_1
	 =  case happyOut32 happy_x_1 of { (HappyWrap32 happy_var_1) -> 
	happyIn31
		 (happy_var_1
	)}

happyReduce_63 = happySpecReduce_1  13# happyReduction_63
happyReduction_63 happy_x_1
	 =  happyIn32
		 (Syntax.Normal.Abs.BoolType
	)

happyReduce_64 = happySpecReduce_1  13# happyReduction_64
happyReduction_64 happy_x_1
	 =  happyIn32
		 (Syntax.Normal.Abs.NatType
	)

happyReduce_65 = happySpecReduce_1  13# happyReduction_65
happyReduction_65 happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	happyIn32
		 (Syntax.Normal.Abs.VarType happy_var_1
	)}

happyReduce_66 = happySpecReduce_3  13# happyReduction_66
happyReduction_66 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut30 happy_x_2 of { (HappyWrap30 happy_var_2) -> 
	happyIn32
		 (happy_var_2
	)}

happyReduce_67 = happySpecReduce_3  14# happyReduction_67
happyReduction_67 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	case happyOut30 happy_x_3 of { (HappyWrap30 happy_var_3) -> 
	happyIn33
		 (Syntax.Normal.Abs.FieldType happy_var_1 happy_var_3
	)}}

happyReduce_68 = happySpecReduce_0  15# happyReduction_68
happyReduction_68  =  happyIn34
		 ([]
	)

happyReduce_69 = happySpecReduce_1  15# happyReduction_69
happyReduction_69 happy_x_1
	 =  case happyOut33 happy_x_1 of { (HappyWrap33 happy_var_1) -> 
	happyIn34
		 ((:[]) happy_var_1
	)}

happyReduce_70 = happySpecReduce_3  15# happyReduction_70
happyReduction_70 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut33 happy_x_1 of { (HappyWrap33 happy_var_1) -> 
	case happyOut34 happy_x_3 of { (HappyWrap34 happy_var_3) -> 
	happyIn34
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_71 = happySpecReduce_3  16# happyReduction_71
happyReduction_71 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut22 happy_x_1 of { (HappyWrap22 happy_var_1) -> 
	case happyOut30 happy_x_3 of { (HappyWrap30 happy_var_3) -> 
	happyIn35
		 (Syntax.Normal.Abs.Typing happy_var_1 happy_var_3
	)}}

happyNewToken action sts stk [] =
	happyDoAction 42# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 1#;
	PT _ (TS _ 2) -> cont 2#;
	PT _ (TS _ 3) -> cont 3#;
	PT _ (TS _ 4) -> cont 4#;
	PT _ (TS _ 5) -> cont 5#;
	PT _ (TS _ 6) -> cont 6#;
	PT _ (TS _ 7) -> cont 7#;
	PT _ (TS _ 8) -> cont 8#;
	PT _ (TS _ 9) -> cont 9#;
	PT _ (TS _ 10) -> cont 10#;
	PT _ (TS _ 11) -> cont 11#;
	PT _ (TS _ 12) -> cont 12#;
	PT _ (TS _ 13) -> cont 13#;
	PT _ (TS _ 14) -> cont 14#;
	PT _ (TS _ 15) -> cont 15#;
	PT _ (TS _ 16) -> cont 16#;
	PT _ (TS _ 17) -> cont 17#;
	PT _ (TS _ 18) -> cont 18#;
	PT _ (TS _ 19) -> cont 19#;
	PT _ (TS _ 20) -> cont 20#;
	PT _ (TS _ 21) -> cont 21#;
	PT _ (TS _ 22) -> cont 22#;
	PT _ (TS _ 23) -> cont 23#;
	PT _ (TS _ 24) -> cont 24#;
	PT _ (TS _ 25) -> cont 25#;
	PT _ (TS _ 26) -> cont 26#;
	PT _ (TS _ 27) -> cont 27#;
	PT _ (TS _ 28) -> cont 28#;
	PT _ (TS _ 29) -> cont 29#;
	PT _ (TS _ 30) -> cont 30#;
	PT _ (TS _ 31) -> cont 31#;
	PT _ (TS _ 32) -> cont 32#;
	PT _ (TS _ 33) -> cont 33#;
	PT _ (TS _ 34) -> cont 34#;
	PT _ (TS _ 35) -> cont 35#;
	PT _ (TS _ 36) -> cont 36#;
	PT _ (TS _ 37) -> cont 37#;
	PT _ (TS _ 38) -> cont 38#;
	PT _ (TS _ 39) -> cont 39#;
	PT _ (TS _ 40) -> cont 40#;
	PT _ (TV happy_dollar_dollar) -> cont 41#;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 42# tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = ((>>=))
happyReturn :: () => a -> Err a
happyReturn = (return)
happyThen1 m k tks = ((>>=)) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> Err a
happyError' = (\(tokens, _) -> happyError tokens)
pProgram tks = happySomeParser where
 happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (let {(HappyWrap20 x') = happyOut20 x} in x'))

pListExpr tks = happySomeParser where
 happySomeParser = happyThen (happyParse 1# tks) (\x -> happyReturn (let {(HappyWrap21 x') = happyOut21 x} in x'))

pExpr tks = happySomeParser where
 happySomeParser = happyThen (happyParse 2# tks) (\x -> happyReturn (let {(HappyWrap22 x') = happyOut22 x} in x'))

pMatchCase tks = happySomeParser where
 happySomeParser = happyThen (happyParse 3# tks) (\x -> happyReturn (let {(HappyWrap23 x') = happyOut23 x} in x'))

pListMatchCase tks = happySomeParser where
 happySomeParser = happyThen (happyParse 4# tks) (\x -> happyReturn (let {(HappyWrap24 x') = happyOut24 x} in x'))

pBinding tks = happySomeParser where
 happySomeParser = happyThen (happyParse 5# tks) (\x -> happyReturn (let {(HappyWrap25 x') = happyOut25 x} in x'))

pListBinding tks = happySomeParser where
 happySomeParser = happyThen (happyParse 6# tks) (\x -> happyReturn (let {(HappyWrap26 x') = happyOut26 x} in x'))

pExpr1 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 7# tks) (\x -> happyReturn (let {(HappyWrap27 x') = happyOut27 x} in x'))

pExpr2 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 8# tks) (\x -> happyReturn (let {(HappyWrap28 x') = happyOut28 x} in x'))

pExpr3 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 9# tks) (\x -> happyReturn (let {(HappyWrap29 x') = happyOut29 x} in x'))

pType tks = happySomeParser where
 happySomeParser = happyThen (happyParse 10# tks) (\x -> happyReturn (let {(HappyWrap30 x') = happyOut30 x} in x'))

pType1 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 11# tks) (\x -> happyReturn (let {(HappyWrap31 x') = happyOut31 x} in x'))

pType2 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 12# tks) (\x -> happyReturn (let {(HappyWrap32 x') = happyOut32 x} in x'))

pFieldType tks = happySomeParser where
 happySomeParser = happyThen (happyParse 13# tks) (\x -> happyReturn (let {(HappyWrap33 x') = happyOut33 x} in x'))

pListFieldType tks = happySomeParser where
 happySomeParser = happyThen (happyParse 14# tks) (\x -> happyReturn (let {(HappyWrap34 x') = happyOut34 x} in x'))

pTyping tks = happySomeParser where
 happySomeParser = happyThen (happyParse 15# tks) (\x -> happyReturn (let {(HappyWrap35 x') = happyOut35 x} in x'))

happySeq = happyDontSeq


type Err = Either String

happyError :: [Token] -> Err a
happyError ts = Left $
  "syntax error at " ++ tokenPos ts ++
  case ts of
    []      -> []
    [Err _] -> " due to lexer error"
    t:_     -> " before `" ++ (prToken t) ++ "'"

myLexer :: String -> [Token]
myLexer = tokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Prelude.Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Prelude.Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Prelude.Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif



















data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}
          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Prelude.Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}
                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}
                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+# i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else Prelude.False
         action
          | check     = indexShortOffAddr happyTable off_i
          | Prelude.otherwise = indexShortOffAddr happyDefActions st




indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `Prelude.mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)













-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+# nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ((Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
