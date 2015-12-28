module Test
  ( ImmutableList(..)
  , makeList
  , length
  , push
  ) where
-- module Test (List(..), makeList) where

-- import Prelude hiding(mod)
import Prelude
import Data.Function
import Data.List hiding (length)
-- foreign import data Mod :: *
-- foreign import mod :: Mod

foreign import data ImmutableList :: * -> *
foreign import makeList :: forall t. Array t -> ImmutableList t
foreign import length :: forall t. ImmutableList t -> Number

foreign import _push :: forall t. Fn2 (ImmutableList t) t (ImmutableList t)
push :: forall t. ImmutableList t -> t -> ImmutableList t
push = runFn2 _push
