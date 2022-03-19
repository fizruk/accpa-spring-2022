module TypeCheck where

import           Convert
import qualified Syntax.Nameless.Abs as Nameless
import           Syntax.Normal.Abs
import qualified TypeCheck.Nameless  as Nameless

type Context = [(Ident, Type)]

typeOf :: Context -> Expr -> Either String Type
typeOf context expr = fromNamelessType <$> Nameless.typeOf context' expr'
  where
    context' = toNamelessContext context
    expr' = toNameless_ expr

toNamelessContext :: Context -> Nameless.Context
toNamelessContext _ = []
