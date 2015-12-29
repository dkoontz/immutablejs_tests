module Immutable.Record
  ( ImmutableRecord(..)
  , makeRecord
  , getField
  , getInt
  , getString
  , setField
  , set
  ) where

import Prelude
import Data.Function
import Data.Maybe
import Immutable.Utils

foreign import data ImmutableRecord :: # * -> *

foreign import makeRecord :: forall t. Object t -> ImmutableRecord t

foreign import _get :: forall t v. Fn2 String (ImmutableRecord t) v
getField :: forall t v. String -> ImmutableRecord t -> v
getField = runFn2 _get

getInt :: forall t. String -> ImmutableRecord t -> Maybe Int
getInt = getField

getString :: forall t. String -> ImmutableRecord t -> Maybe String
getString = getField

foreign import _set :: forall t v. Fn3 String v (ImmutableRecord t) (ImmutableRecord t)
setField :: forall t v. String -> v -> ImmutableRecord t -> ImmutableRecord t
setField = runFn3 _set

foreign import _merge :: forall t. Fn2 (Object t) (ImmutableRecord t) (ImmutableRecord t)
set :: forall t. Object t -> ImmutableRecord t -> ImmutableRecord t
set = runFn2 _merge
