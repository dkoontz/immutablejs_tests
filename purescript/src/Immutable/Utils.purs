module Immutable.Utils (
  unsafeShow,
  maybeUndefined,
  unsafeEq
  ) where
  
import Data.Function
import Data.Maybe

foreign import unsafeShow :: forall v. v -> String
foreign import _maybeUndefined :: forall v. Fn3 (Maybe v) (v -> Maybe v) v (Maybe v)
foreign import _unsafeEq :: forall v. Fn2 v v Boolean

maybeUndefined = runFn3 _maybeUndefined Nothing Just

unsafeEq = runFn2 _unsafeEq