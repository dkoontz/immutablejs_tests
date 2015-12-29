module Immutable.List
  ( ImmutableList(..)
  , makeList
  , size
  , push
  , set
  , filterNot
  ) where

import Prelude
import Data.Function

foreign import data ImmutableList :: * -> *

foreign import makeList :: forall t. Array t -> ImmutableList t
foreign import size :: forall t. ImmutableList t -> Number

foreign import _push :: forall t. Fn2 t (ImmutableList t) (ImmutableList t)
push :: forall t. t -> ImmutableList t -> ImmutableList t
push = runFn2 _push

foreign import _set :: forall t. Fn3 Int t (ImmutableList t) (ImmutableList t)
set :: forall t. Int -> t -> ImmutableList t -> ImmutableList t
set = runFn3 _set

foreign import _filterNot :: forall t. Fn2 (t -> Boolean) (ImmutableList t) (ImmutableList t)
filterNot :: forall t. (t -> Boolean) -> ImmutableList t -> ImmutableList t
filterNot = runFn2 _filterNot
