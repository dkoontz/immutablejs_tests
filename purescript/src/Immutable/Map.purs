module Immutable.Map (
  Map(..),
  empty,
  get,
  set,
  remove,
  update,
  merge,
  map
  ) where

-- import Prelude hiding(map, mod)
import Data.Maybe
import Data.Function
import Data.Monoid
import Immutable.Utils

foreign import data Mod :: *
foreign import mod :: Mod

foreign import data Map :: * -> * -> *

foreign import empty :: forall k v. Map k v

foreign import _get :: forall k v. Fn3 (v -> Maybe v) (Map k v) k (Maybe v)
get = runFn3 _get maybeUndefined

foreign import _set :: forall k v. Fn3 (Map k v) k v (Map k v)
set = runFn3 _set

foreign import _remove :: forall k v. Fn2 (Map k v) k (Map k v)
remove = runFn2 _remove

foreign import _update :: forall k v. Fn3 (Map k v) k (v -> v) (Map k v)
update = runFn3 _update

foreign import _merge :: forall k v. Fn2 (Map k v) (Map k v) (Map k v)
merge = runFn2 _merge

foreign import _map :: forall k a b. Fn2 (a -> b) (Map k a) (Map k b)
map = runFn2 _map

-- instance showMap :: Show (Map k v) where
--   show = unsafeShow
--
-- instance eqMap :: Eq (Map k v) where
--   (==) = unsafeEq
--   (/=) x y = not (x == y)
--
-- instance functorMap :: Functor (Map k) where
--   (<$>) = map
--
-- instance semigroupMap :: Semigroup (Map k v) where
--   (<>) = merge
--
-- instance monoidMap :: Monoid (Map k v) where
--   mempty = empty

-- module Immutable.Main where
--
-- import qualified Immutable.Map as Map
-- import Debug.Trace
--
-- main = do
--   let m = Map.set Map.empty "l" 1
--   let m2 = Map.remove m "l"
--   print m2