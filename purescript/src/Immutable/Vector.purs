module Immutable.Vector (
  Vector(..),
  empty,
  get,
  set,
  push,
  pop,
  unshift,
  update,
  map,
  reduce,
  reduceRight,
  length,
  first,
  rest
  ) where

import Data.Maybe
import Data.Function
-- import Data.Foldable
-- import Data.Monoid
import Immutable.Utils

foreign import data Mod :: *
foreign import mod :: Mod
foreign import data Vector :: * -> *
foreign import empty :: forall v. Vector v
foreign import length :: forall v. Vector v -> Number
foreign import first :: forall v. Vector v -> v
foreign import rest :: forall v. Vector v -> Vector v
foreign import pop :: forall v. Vector v -> Vector v

foreign import _get :: forall v. Fn3 (v -> Maybe v) (Vector v) Number (Maybe v)
get = runFn3 _get maybeUndefined

foreign import _set :: forall v. Fn3 (Vector v) Number v (Vector v)
set = runFn3 _set

foreign import _push :: forall v. Fn2 (Vector v) v (Vector v)
push = runFn2 _push

foreign import _concat :: forall v. Fn2 (Vector v) (Vector v) (Vector v)
concat = runFn2 _concat

foreign import _unshift :: forall v. Fn2 (Vector v) v (Vector v)
unshift = runFn2 _unshift

foreign import _update :: forall v. Fn3 (Vector v) Number (v -> v) (Vector v)
update = runFn3 _update

foreign import _map :: forall a b. Fn2 (a -> b) (Vector a) (Vector b)
map = runFn2 _map

foreign import _reduce :: forall a b. Fn3 (b -> a -> b) b (Vector a) b
reduce = runFn3 _reduce

foreign import _reduceRight :: forall a b. Fn3 (a -> b -> b) b (Vector a) b
reduceRight = runFn3 _reduceRight

-- instance showVector :: Show (Vector v) where
--   show = unsafeShow
--
-- instance eqVector :: Eq (Vector v) where
--   (==) = unsafeEq
--   (/=) x y = not (x == y)
--
-- instance functorVector :: Functor Vector where
--   (<$>) = map
--
-- instance semigroupVector :: Semigroup (Vector v) where
--   (<>) = concat
--
-- instance monoidVector :: Monoid (Vector v) where
--   mempty = empty
--
-- instance foldableVector :: Foldable Vector where
--   foldl = reduce
--   foldr = reduceRight
--   foldMap f v = foldl (\acc x -> f x <> acc) mempty v
