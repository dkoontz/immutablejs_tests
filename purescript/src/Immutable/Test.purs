module Test
  ( ImmutableList(..)
  , length
  , plusNine
  , makeList
  ) where
-- module Test (List(..), makeList) where

-- import Prelude hiding(mod)
import Prelude

-- foreign import data Mod :: *
-- foreign import mod :: Mod

foreign import data ImmutableList :: * -> *
foreign import plusNine :: Int -> Int
foreign import makeList :: Unit -> ImmutableList Number
foreign import length :: forall a. ImmutableList a -> Number
