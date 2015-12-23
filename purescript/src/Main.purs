module Main where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console
-- import qualified Immutable.Map as IMap
-- import qualified Immutable.Utils as IUtils
import Test
import Utils

getLength :: forall a. ImmutableList a -> Number
getLength list = length list

-- store :: IMap.Map String String
-- -- store = IMap.set IMap.empty "Foo" "Bar"
-- store = IMap.empty "test" "text"

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  makeList unit
  |> getLength
  |> show
  |> log
  -- IUtils.unsafeShow (store) |> log
