module Immutable.Utils
  ( undefinedToMaybe
  , unsafeShow
  ) where
--
import Data.Function
import Data.Maybe

foreign import _undefinedToMaybe :: forall t. Fn3 (Maybe t) (t -> Maybe t) t (Maybe t)
undefinedToMaybe :: forall t. t -> Maybe t
undefinedToMaybe = runFn3 _undefinedToMaybe Nothing Just

foreign import unsafeShow :: forall v. v -> String
-- foreign import _maybeUndefined :: forall v. Fn3 (Maybe v) (v -> Maybe v) v (Maybe v)
-- foreign import _unsafeEq :: forall v. Fn2 v v Boolean
--
-- maybeUndefined = runFn3 _maybeUndefined Nothing Just
--
-- unsafeEq = runFn2 _unsafeEq
