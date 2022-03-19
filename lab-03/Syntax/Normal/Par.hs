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
  , pBinding
  , pListBinding
  , pExpr1
  , pExpr2
  , pExpr3
  , pType
  , pType1
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
newtype HappyWrap16 = HappyWrap16 (Syntax.Normal.Abs.Ident)
happyIn16 :: (Syntax.Normal.Abs.Ident) -> (HappyAbsSyn )
happyIn16 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap16 x)
{-# INLINE happyIn16 #-}
happyOut16 :: (HappyAbsSyn ) -> HappyWrap16
happyOut16 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut16 #-}
newtype HappyWrap17 = HappyWrap17 (Syntax.Normal.Abs.Program)
happyIn17 :: (Syntax.Normal.Abs.Program) -> (HappyAbsSyn )
happyIn17 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap17 x)
{-# INLINE happyIn17 #-}
happyOut17 :: (HappyAbsSyn ) -> HappyWrap17
happyOut17 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut17 #-}
newtype HappyWrap18 = HappyWrap18 ([Syntax.Normal.Abs.Expr])
happyIn18 :: ([Syntax.Normal.Abs.Expr]) -> (HappyAbsSyn )
happyIn18 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap18 x)
{-# INLINE happyIn18 #-}
happyOut18 :: (HappyAbsSyn ) -> HappyWrap18
happyOut18 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut18 #-}
newtype HappyWrap19 = HappyWrap19 (Syntax.Normal.Abs.Expr)
happyIn19 :: (Syntax.Normal.Abs.Expr) -> (HappyAbsSyn )
happyIn19 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap19 x)
{-# INLINE happyIn19 #-}
happyOut19 :: (HappyAbsSyn ) -> HappyWrap19
happyOut19 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut19 #-}
newtype HappyWrap20 = HappyWrap20 (Syntax.Normal.Abs.Binding)
happyIn20 :: (Syntax.Normal.Abs.Binding) -> (HappyAbsSyn )
happyIn20 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap20 x)
{-# INLINE happyIn20 #-}
happyOut20 :: (HappyAbsSyn ) -> HappyWrap20
happyOut20 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut20 #-}
newtype HappyWrap21 = HappyWrap21 ([Syntax.Normal.Abs.Binding])
happyIn21 :: ([Syntax.Normal.Abs.Binding]) -> (HappyAbsSyn )
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
newtype HappyWrap23 = HappyWrap23 (Syntax.Normal.Abs.Expr)
happyIn23 :: (Syntax.Normal.Abs.Expr) -> (HappyAbsSyn )
happyIn23 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap23 x)
{-# INLINE happyIn23 #-}
happyOut23 :: (HappyAbsSyn ) -> HappyWrap23
happyOut23 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut23 #-}
newtype HappyWrap24 = HappyWrap24 (Syntax.Normal.Abs.Expr)
happyIn24 :: (Syntax.Normal.Abs.Expr) -> (HappyAbsSyn )
happyIn24 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap24 x)
{-# INLINE happyIn24 #-}
happyOut24 :: (HappyAbsSyn ) -> HappyWrap24
happyOut24 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut24 #-}
newtype HappyWrap25 = HappyWrap25 (Syntax.Normal.Abs.Type)
happyIn25 :: (Syntax.Normal.Abs.Type) -> (HappyAbsSyn )
happyIn25 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap25 x)
{-# INLINE happyIn25 #-}
happyOut25 :: (HappyAbsSyn ) -> HappyWrap25
happyOut25 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut25 #-}
newtype HappyWrap26 = HappyWrap26 (Syntax.Normal.Abs.Type)
happyIn26 :: (Syntax.Normal.Abs.Type) -> (HappyAbsSyn )
happyIn26 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap26 x)
{-# INLINE happyIn26 #-}
happyOut26 :: (HappyAbsSyn ) -> HappyWrap26
happyOut26 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut26 #-}
newtype HappyWrap27 = HappyWrap27 (Syntax.Normal.Abs.FieldType)
happyIn27 :: (Syntax.Normal.Abs.FieldType) -> (HappyAbsSyn )
happyIn27 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap27 x)
{-# INLINE happyIn27 #-}
happyOut27 :: (HappyAbsSyn ) -> HappyWrap27
happyOut27 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut27 #-}
newtype HappyWrap28 = HappyWrap28 ([Syntax.Normal.Abs.FieldType])
happyIn28 :: ([Syntax.Normal.Abs.FieldType]) -> (HappyAbsSyn )
happyIn28 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap28 x)
{-# INLINE happyIn28 #-}
happyOut28 :: (HappyAbsSyn ) -> HappyWrap28
happyOut28 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut28 #-}
newtype HappyWrap29 = HappyWrap29 (Syntax.Normal.Abs.Typing)
happyIn29 :: (Syntax.Normal.Abs.Typing) -> (HappyAbsSyn )
happyIn29 x = Happy_GHC_Exts.unsafeCoerce# (HappyWrap29 x)
{-# INLINE happyIn29 #-}
happyOut29 :: (HappyAbsSyn ) -> HappyWrap29
happyOut29 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut29 #-}
happyInTok :: (Token) -> (HappyAbsSyn )
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn ) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x20\x04\xee\x5a\x00\x00\x00\x20\x04\xee\x5a\x00\x00\x00\x20\x04\xee\x5a\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x20\x04\xa2\x4a\x00\x00\x00\x20\x04\xa2\x4a\x00\x00\x00\x20\x04\x02\x48\x00\x00\x00\x20\xc0\x00\x10\x00\x00\x00\x20\xc0\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x20\x04\xee\x5a\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x20\x04\xa2\x4a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x04\xee\x5a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x20\x04\xee\x5a\x00\x00\x00\x20\x04\x02\x48\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x20\x04\x02\x48\x00\x00\x00\x20\x04\x02\x48\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\xc0\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x04\xa2\x4a\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x04\xee\x5a\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x20\x04\xee\x5a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x20\xc0\x00\x10\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x20\xc0\x00\x10\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x20\xc0\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x20\x04\xee\x5a\x00\x00\x00\x20\x04\xee\x5a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x20\xc0\x00\x10\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x20\x04\xee\x5a\x00\x00\x00\x20\x04\xee\x5a\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x20\x04\xee\x5a\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pProgram","%start_pListExpr","%start_pExpr","%start_pBinding","%start_pListBinding","%start_pExpr1","%start_pExpr2","%start_pExpr3","%start_pType","%start_pType1","%start_pFieldType","%start_pListFieldType","%start_pTyping","Ident","Program","ListExpr","Expr","Binding","ListBinding","Expr1","Expr2","Expr3","Type","Type1","FieldType","ListFieldType","Typing","'('","')'","','","'->'","'.'","'0'","':'","';'","'='","'Bool'","'Nat'","'else'","'false'","'fun'","'if'","'in'","'iszero'","'let'","'pred'","'return'","'succ'","'then'","'true'","'{'","'}'","L_Ident","%eof"]
        bit_start = st Prelude.* 56
        bit_end = (st Prelude.+ 1) Prelude.* 56
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..55]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x14\x00\x14\x00\x14\x00\xeb\xff\xeb\xff\x27\x00\x27\x00\x29\x00\x05\x00\x02\x00\xeb\xff\xeb\xff\x14\x00\xeb\xff\x00\x00\x00\x00\x03\x00\x27\x00\x00\x00\x06\x00\x15\x00\x14\x00\x00\x00\x00\x00\x1f\x00\x14\x00\x29\x00\x18\x00\x29\x00\x29\x00\x00\x00\x18\x00\x2e\x00\x34\x00\x32\x00\x32\x00\x32\x00\x05\x00\x00\x00\x00\x00\x32\x00\x57\x00\x4a\x00\xfc\xff\x43\x00\x01\x00\x79\x00\x65\x00\x68\x00\x68\x00\x68\x00\x68\x00\x80\x00\x6e\x00\x00\x00\x14\x00\x71\x00\x14\x00\x00\x00\x71\x00\x73\x00\x05\x00\x8f\x00\x78\x00\x05\x00\x7b\x00\x95\x00\x95\x00\x8c\x00\x96\x00\x88\x00\x83\x00\xa1\x00\x05\x00\x00\x00\x00\x00\x9d\x00\x14\x00\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x97\x00\x9a\x00\x05\x00\xaa\x00\x14\x00\x14\x00\x00\x00\x00\x00\x98\x00\x9b\x00\x14\x00\x94\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x51\x00\x5a\x00\x6c\x00\x04\x00\xc2\x00\xb8\x00\x4e\x00\x09\x00\x41\x00\xac\x00\x19\x00\x13\x00\x3f\x00\x00\x00\x00\x00\x00\x00\x00\x00\xbd\x00\x00\x00\x00\x00\x00\x00\x75\x00\x00\x00\x00\x00\x00\x00\x7e\x00\x31\x00\xb5\x00\x33\x00\x5f\x00\x00\x00\xc8\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x64\x00\x00\x00\x00\x00\x00\x00\x00\x00\x3d\x00\x00\x00\x00\x00\xbd\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x63\x00\xca\x00\x87\x00\x00\x00\xb9\x00\x00\x00\x67\x00\x00\x00\x44\x00\x6d\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xc1\x00\x00\x00\x70\x00\x00\x00\x00\x00\x00\x00\x90\x00\x99\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x76\x00\x00\x00\xa2\x00\xab\x00\x00\x00\x00\x00\x00\x00\x00\x00\xb4\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\xf0\xff\xf0\xff\x00\x00\x00\x00\xe7\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xd1\xff\x00\x00\x00\x00\xf2\xff\xda\xff\x00\x00\xe9\xff\xe3\xff\xdf\xff\x00\x00\x00\x00\xdb\xff\xdc\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xdd\xff\xe7\xff\x00\x00\xd0\xff\x00\x00\x00\x00\x00\x00\x00\x00\xd5\xff\xd4\xff\x00\x00\xd6\xff\xd1\xff\x00\x00\x00\x00\x00\x00\x00\x00\xe6\xff\x00\x00\x00\x00\x00\x00\x00\x00\xef\xff\x00\x00\xf1\xff\xf0\xff\xe7\xff\x00\x00\xe4\xff\x00\x00\x00\x00\x00\x00\x00\x00\xd1\xff\x00\x00\x00\x00\xe2\xff\xe1\xff\x00\x00\xe0\xff\x00\x00\x00\x00\x00\x00\x00\x00\xce\xff\xd9\xff\x00\x00\x00\x00\x00\x00\xea\xff\xd2\xff\xcf\xff\xd3\xff\xd8\xff\xd7\xff\xde\xff\xe8\xff\xe5\xff\xee\xff\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xec\xff\xed\xff\x00\x00\x00\x00\x00\x00\x00\x00\xeb\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x05\x00\x01\x00\x01\x00\x00\x00\x1a\x00\x01\x00\x06\x00\x04\x00\x00\x00\x07\x00\x05\x00\x0a\x00\x0b\x00\x0d\x00\x0a\x00\x0b\x00\x08\x00\x11\x00\x00\x00\x13\x00\x01\x00\x15\x00\x1b\x00\x17\x00\x00\x00\x06\x00\x1a\x00\x1b\x00\x18\x00\x0b\x00\x0c\x00\x01\x00\x0d\x00\x0e\x00\x0f\x00\x0b\x00\x11\x00\x12\x00\x13\x00\x01\x00\x15\x00\x01\x00\x17\x00\x18\x00\x06\x00\x1a\x00\x06\x00\x1b\x00\x00\x00\x1a\x00\x00\x00\x0d\x00\x07\x00\x0d\x00\x03\x00\x11\x00\x08\x00\x13\x00\x08\x00\x15\x00\x00\x00\x17\x00\x00\x00\x17\x00\x1a\x00\x03\x00\x1a\x00\x00\x00\x06\x00\x07\x00\x08\x00\x0b\x00\x0c\x00\x09\x00\x0a\x00\x0d\x00\x1b\x00\x00\x00\x0b\x00\x0c\x00\x00\x00\x01\x00\x02\x00\x03\x00\x07\x00\x08\x00\x06\x00\x07\x00\x08\x00\x00\x00\x04\x00\x02\x00\x03\x00\x1b\x00\x00\x00\x06\x00\x07\x00\x08\x00\x00\x00\x1a\x00\x02\x00\x03\x00\x08\x00\x03\x00\x06\x00\x07\x00\x08\x00\x00\x00\x09\x00\x0a\x00\x03\x00\x09\x00\x0a\x00\x06\x00\x07\x00\x08\x00\x00\x00\x09\x00\x0a\x00\x03\x00\x09\x00\x0a\x00\x06\x00\x07\x00\x08\x00\x00\x00\x09\x00\x0a\x00\x03\x00\x09\x00\x1b\x00\x06\x00\x07\x00\x08\x00\x00\x00\x08\x00\x1b\x00\x03\x00\x1a\x00\x19\x00\x06\x00\x07\x00\x08\x00\x00\x00\x02\x00\x1a\x00\x03\x00\x19\x00\x09\x00\x06\x00\x07\x00\x08\x00\x00\x00\x05\x00\x05\x00\x03\x00\x1a\x00\x16\x00\x06\x00\x07\x00\x08\x00\x00\x00\x02\x00\x07\x00\x03\x00\x0c\x00\x10\x00\x06\x00\x07\x00\x08\x00\x00\x00\x02\x00\x19\x00\x03\x00\x14\x00\x18\x00\x06\x00\x07\x00\x08\x00\x00\x00\x00\x00\x0a\x00\x03\x00\x00\x00\x00\x00\x06\x00\x07\x00\x08\x00\x00\x00\x06\x00\x07\x00\x08\x00\x00\x00\x00\x00\xff\xff\x07\x00\x08\x00\x04\x00\x05\x00\x00\x00\xff\xff\x00\x00\xff\xff\x04\x00\x05\x00\x04\x00\x05\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x3c\x00\x16\x00\x26\x00\x2e\x00\x0f\x00\x26\x00\x17\x00\x31\x00\x0f\x00\x4a\x00\x3c\x00\x27\x00\x28\x00\x18\x00\x27\x00\x28\x00\x2b\x00\x1b\x00\x20\x00\x1d\x00\x16\x00\x1e\x00\xff\xff\x1f\x00\x20\x00\x17\x00\x0f\x00\xff\xff\x2b\x00\x21\x00\x22\x00\x48\x00\x18\x00\x19\x00\x1a\x00\x23\x00\x1b\x00\x1c\x00\x1d\x00\x16\x00\x1e\x00\x16\x00\x1f\x00\x20\x00\x17\x00\x0f\x00\x17\x00\xff\xff\x0f\x00\x0f\x00\x0f\x00\x18\x00\x41\x00\x18\x00\x40\x00\x1b\x00\x45\x00\x1d\x00\x43\x00\x1e\x00\x20\x00\x1f\x00\x0f\x00\x1f\x00\x0f\x00\x10\x00\x0f\x00\x20\x00\x11\x00\x12\x00\x13\x00\x21\x00\x3c\x00\x28\x00\x29\x00\x14\x00\xff\xff\x0f\x00\x21\x00\x51\x00\x0f\x00\x35\x00\x36\x00\x34\x00\x2c\x00\x13\x00\x11\x00\x12\x00\x13\x00\x0f\x00\x3e\x00\x33\x00\x34\x00\xff\xff\x0f\x00\x11\x00\x12\x00\x13\x00\x0f\x00\x0f\x00\x58\x00\x34\x00\x42\x00\x39\x00\x11\x00\x12\x00\x13\x00\x0f\x00\x3e\x00\x29\x00\x32\x00\x53\x00\x29\x00\x11\x00\x12\x00\x13\x00\x0f\x00\x50\x00\x29\x00\x48\x00\x4a\x00\x29\x00\x11\x00\x12\x00\x13\x00\x0f\x00\x5c\x00\x29\x00\x46\x00\x3a\x00\xff\xff\x11\x00\x12\x00\x13\x00\x0f\x00\x38\x00\xff\xff\x56\x00\x0f\x00\x55\x00\x11\x00\x12\x00\x13\x00\x0f\x00\x53\x00\x0f\x00\x5a\x00\x50\x00\x4f\x00\x11\x00\x12\x00\x13\x00\x0f\x00\x3c\x00\x3c\x00\x59\x00\x0f\x00\x4e\x00\x11\x00\x12\x00\x13\x00\x0f\x00\x4c\x00\x5c\x00\x60\x00\x5e\x00\x5f\x00\x11\x00\x12\x00\x13\x00\x0f\x00\x62\x00\x66\x00\x5f\x00\x64\x00\x63\x00\x11\x00\x12\x00\x13\x00\x0f\x00\x44\x00\x24\x00\x64\x00\x0f\x00\x55\x00\x11\x00\x12\x00\x13\x00\x0f\x00\x2d\x00\x12\x00\x13\x00\x4c\x00\x2e\x00\x00\x00\x3a\x00\x13\x00\x2f\x00\x30\x00\x2e\x00\x00\x00\x2e\x00\x00\x00\x2f\x00\x41\x00\x2f\x00\x57\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (13, 49) [
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
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
	(49 , happyReduce_49)
	]

happy_n_terms = 28 :: Prelude.Int
happy_n_nonterms = 14 :: Prelude.Int

happyReduce_13 = happySpecReduce_1  0# happyReduction_13
happyReduction_13 happy_x_1
	 =  case happyOutTok happy_x_1 of { (PT _ (TV happy_var_1)) -> 
	happyIn16
		 (Syntax.Normal.Abs.Ident happy_var_1
	)}

happyReduce_14 = happySpecReduce_1  1# happyReduction_14
happyReduction_14 happy_x_1
	 =  case happyOut18 happy_x_1 of { (HappyWrap18 happy_var_1) -> 
	happyIn17
		 (Syntax.Normal.Abs.ProgramExprs happy_var_1
	)}

happyReduce_15 = happySpecReduce_0  2# happyReduction_15
happyReduction_15  =  happyIn18
		 ([]
	)

happyReduce_16 = happySpecReduce_1  2# happyReduction_16
happyReduction_16 happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	happyIn18
		 ((:[]) happy_var_1
	)}

happyReduce_17 = happySpecReduce_3  2# happyReduction_17
happyReduction_17 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	case happyOut18 happy_x_3 of { (HappyWrap18 happy_var_3) -> 
	happyIn18
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_18 = happyReduce 6# 3# happyReduction_18
happyReduction_18 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut19 happy_x_2 of { (HappyWrap19 happy_var_2) -> 
	case happyOut19 happy_x_4 of { (HappyWrap19 happy_var_4) -> 
	case happyOut19 happy_x_6 of { (HappyWrap19 happy_var_6) -> 
	happyIn19
		 (Syntax.Normal.Abs.If happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_19 = happyReduce 6# 3# happyReduction_19
happyReduction_19 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut16 happy_x_2 of { (HappyWrap16 happy_var_2) -> 
	case happyOut19 happy_x_4 of { (HappyWrap19 happy_var_4) -> 
	case happyOut19 happy_x_6 of { (HappyWrap19 happy_var_6) -> 
	happyIn19
		 (Syntax.Normal.Abs.Let happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest}}}

happyReduce_20 = happyReduce 10# 3# happyReduction_20
happyReduction_20 (happy_x_10 `HappyStk`
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
	 = case happyOut16 happy_x_3 of { (HappyWrap16 happy_var_3) -> 
	case happyOut25 happy_x_5 of { (HappyWrap25 happy_var_5) -> 
	case happyOut19 happy_x_9 of { (HappyWrap19 happy_var_9) -> 
	happyIn19
		 (Syntax.Normal.Abs.Abstraction happy_var_3 happy_var_5 happy_var_9
	) `HappyStk` happyRest}}}

happyReduce_21 = happySpecReduce_3  3# happyReduction_21
happyReduction_21 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut21 happy_x_2 of { (HappyWrap21 happy_var_2) -> 
	happyIn19
		 (Syntax.Normal.Abs.Record happy_var_2
	)}

happyReduce_22 = happySpecReduce_1  3# happyReduction_22
happyReduction_22 happy_x_1
	 =  case happyOut22 happy_x_1 of { (HappyWrap22 happy_var_1) -> 
	happyIn19
		 (happy_var_1
	)}

happyReduce_23 = happySpecReduce_3  4# happyReduction_23
happyReduction_23 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	case happyOut19 happy_x_3 of { (HappyWrap19 happy_var_3) -> 
	happyIn20
		 (Syntax.Normal.Abs.Binding happy_var_1 happy_var_3
	)}}

happyReduce_24 = happySpecReduce_0  5# happyReduction_24
happyReduction_24  =  happyIn21
		 ([]
	)

happyReduce_25 = happySpecReduce_1  5# happyReduction_25
happyReduction_25 happy_x_1
	 =  case happyOut20 happy_x_1 of { (HappyWrap20 happy_var_1) -> 
	happyIn21
		 ((:[]) happy_var_1
	)}

happyReduce_26 = happySpecReduce_3  5# happyReduction_26
happyReduction_26 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut20 happy_x_1 of { (HappyWrap20 happy_var_1) -> 
	case happyOut21 happy_x_3 of { (HappyWrap21 happy_var_3) -> 
	happyIn21
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_27 = happySpecReduce_2  6# happyReduction_27
happyReduction_27 happy_x_2
	happy_x_1
	 =  case happyOut22 happy_x_1 of { (HappyWrap22 happy_var_1) -> 
	case happyOut23 happy_x_2 of { (HappyWrap23 happy_var_2) -> 
	happyIn22
		 (Syntax.Normal.Abs.Application happy_var_1 happy_var_2
	)}}

happyReduce_28 = happySpecReduce_1  6# happyReduction_28
happyReduction_28 happy_x_1
	 =  case happyOut23 happy_x_1 of { (HappyWrap23 happy_var_1) -> 
	happyIn22
		 (happy_var_1
	)}

happyReduce_29 = happySpecReduce_2  7# happyReduction_29
happyReduction_29 happy_x_2
	happy_x_1
	 =  case happyOut24 happy_x_2 of { (HappyWrap24 happy_var_2) -> 
	happyIn23
		 (Syntax.Normal.Abs.Succ happy_var_2
	)}

happyReduce_30 = happySpecReduce_2  7# happyReduction_30
happyReduction_30 happy_x_2
	happy_x_1
	 =  case happyOut24 happy_x_2 of { (HappyWrap24 happy_var_2) -> 
	happyIn23
		 (Syntax.Normal.Abs.Pred happy_var_2
	)}

happyReduce_31 = happySpecReduce_2  7# happyReduction_31
happyReduction_31 happy_x_2
	happy_x_1
	 =  case happyOut24 happy_x_2 of { (HappyWrap24 happy_var_2) -> 
	happyIn23
		 (Syntax.Normal.Abs.IsZero happy_var_2
	)}

happyReduce_32 = happySpecReduce_1  7# happyReduction_32
happyReduction_32 happy_x_1
	 =  case happyOut24 happy_x_1 of { (HappyWrap24 happy_var_1) -> 
	happyIn23
		 (happy_var_1
	)}

happyReduce_33 = happySpecReduce_3  8# happyReduction_33
happyReduction_33 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut24 happy_x_1 of { (HappyWrap24 happy_var_1) -> 
	case happyOut16 happy_x_3 of { (HappyWrap16 happy_var_3) -> 
	happyIn24
		 (Syntax.Normal.Abs.Dot happy_var_1 happy_var_3
	)}}

happyReduce_34 = happySpecReduce_1  8# happyReduction_34
happyReduction_34 happy_x_1
	 =  happyIn24
		 (Syntax.Normal.Abs.ConstTrue
	)

happyReduce_35 = happySpecReduce_1  8# happyReduction_35
happyReduction_35 happy_x_1
	 =  happyIn24
		 (Syntax.Normal.Abs.ConstFalse
	)

happyReduce_36 = happySpecReduce_1  8# happyReduction_36
happyReduction_36 happy_x_1
	 =  happyIn24
		 (Syntax.Normal.Abs.ConstZero
	)

happyReduce_37 = happySpecReduce_1  8# happyReduction_37
happyReduction_37 happy_x_1
	 =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	happyIn24
		 (Syntax.Normal.Abs.Var happy_var_1
	)}

happyReduce_38 = happySpecReduce_3  8# happyReduction_38
happyReduction_38 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut19 happy_x_2 of { (HappyWrap19 happy_var_2) -> 
	happyIn24
		 (happy_var_2
	)}

happyReduce_39 = happySpecReduce_3  9# happyReduction_39
happyReduction_39 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut26 happy_x_1 of { (HappyWrap26 happy_var_1) -> 
	case happyOut25 happy_x_3 of { (HappyWrap25 happy_var_3) -> 
	happyIn25
		 (Syntax.Normal.Abs.FunType happy_var_1 happy_var_3
	)}}

happyReduce_40 = happySpecReduce_3  9# happyReduction_40
happyReduction_40 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut28 happy_x_2 of { (HappyWrap28 happy_var_2) -> 
	happyIn25
		 (Syntax.Normal.Abs.RecordType happy_var_2
	)}

happyReduce_41 = happySpecReduce_1  9# happyReduction_41
happyReduction_41 happy_x_1
	 =  case happyOut26 happy_x_1 of { (HappyWrap26 happy_var_1) -> 
	happyIn25
		 (happy_var_1
	)}

happyReduce_42 = happySpecReduce_1  10# happyReduction_42
happyReduction_42 happy_x_1
	 =  happyIn26
		 (Syntax.Normal.Abs.BoolType
	)

happyReduce_43 = happySpecReduce_1  10# happyReduction_43
happyReduction_43 happy_x_1
	 =  happyIn26
		 (Syntax.Normal.Abs.NatType
	)

happyReduce_44 = happySpecReduce_3  10# happyReduction_44
happyReduction_44 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut25 happy_x_2 of { (HappyWrap25 happy_var_2) -> 
	happyIn26
		 (happy_var_2
	)}

happyReduce_45 = happySpecReduce_3  11# happyReduction_45
happyReduction_45 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut16 happy_x_1 of { (HappyWrap16 happy_var_1) -> 
	case happyOut25 happy_x_3 of { (HappyWrap25 happy_var_3) -> 
	happyIn27
		 (Syntax.Normal.Abs.FieldType happy_var_1 happy_var_3
	)}}

happyReduce_46 = happySpecReduce_0  12# happyReduction_46
happyReduction_46  =  happyIn28
		 ([]
	)

happyReduce_47 = happySpecReduce_1  12# happyReduction_47
happyReduction_47 happy_x_1
	 =  case happyOut27 happy_x_1 of { (HappyWrap27 happy_var_1) -> 
	happyIn28
		 ((:[]) happy_var_1
	)}

happyReduce_48 = happySpecReduce_3  12# happyReduction_48
happyReduction_48 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut27 happy_x_1 of { (HappyWrap27 happy_var_1) -> 
	case happyOut28 happy_x_3 of { (HappyWrap28 happy_var_3) -> 
	happyIn28
		 ((:) happy_var_1 happy_var_3
	)}}

happyReduce_49 = happySpecReduce_3  13# happyReduction_49
happyReduction_49 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut19 happy_x_1 of { (HappyWrap19 happy_var_1) -> 
	case happyOut25 happy_x_3 of { (HappyWrap25 happy_var_3) -> 
	happyIn29
		 (Syntax.Normal.Abs.Typing happy_var_1 happy_var_3
	)}}

happyNewToken action sts stk [] =
	happyDoAction 27# notHappyAtAll action sts stk []

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
	PT _ (TV happy_dollar_dollar) -> cont 26#;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 27# tk tks = happyError' (tks, explist)
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
 happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (let {(HappyWrap17 x') = happyOut17 x} in x'))

pListExpr tks = happySomeParser where
 happySomeParser = happyThen (happyParse 1# tks) (\x -> happyReturn (let {(HappyWrap18 x') = happyOut18 x} in x'))

pExpr tks = happySomeParser where
 happySomeParser = happyThen (happyParse 2# tks) (\x -> happyReturn (let {(HappyWrap19 x') = happyOut19 x} in x'))

pBinding tks = happySomeParser where
 happySomeParser = happyThen (happyParse 3# tks) (\x -> happyReturn (let {(HappyWrap20 x') = happyOut20 x} in x'))

pListBinding tks = happySomeParser where
 happySomeParser = happyThen (happyParse 4# tks) (\x -> happyReturn (let {(HappyWrap21 x') = happyOut21 x} in x'))

pExpr1 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 5# tks) (\x -> happyReturn (let {(HappyWrap22 x') = happyOut22 x} in x'))

pExpr2 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 6# tks) (\x -> happyReturn (let {(HappyWrap23 x') = happyOut23 x} in x'))

pExpr3 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 7# tks) (\x -> happyReturn (let {(HappyWrap24 x') = happyOut24 x} in x'))

pType tks = happySomeParser where
 happySomeParser = happyThen (happyParse 8# tks) (\x -> happyReturn (let {(HappyWrap25 x') = happyOut25 x} in x'))

pType1 tks = happySomeParser where
 happySomeParser = happyThen (happyParse 9# tks) (\x -> happyReturn (let {(HappyWrap26 x') = happyOut26 x} in x'))

pFieldType tks = happySomeParser where
 happySomeParser = happyThen (happyParse 10# tks) (\x -> happyReturn (let {(HappyWrap27 x') = happyOut27 x} in x'))

pListFieldType tks = happySomeParser where
 happySomeParser = happyThen (happyParse 11# tks) (\x -> happyReturn (let {(HappyWrap28 x') = happyOut28 x} in x'))

pTyping tks = happySomeParser where
 happySomeParser = happyThen (happyParse 12# tks) (\x -> happyReturn (let {(HappyWrap29 x') = happyOut29 x} in x'))

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
