module Main where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console
import qualified Immutable.Map as IMap
import qualified Immutable.Utils as IUtils

(|>) :: forall t1 t2. t2 -> (t2 -> t1) -> t1
(|>) =  flip ($)

store :: IMap.Map String String
-- store = IMap.set IMap.empty "Foo" "Bar"
store = IMap.empty "test" "text"

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  IUtils.unsafeShow (store) |> log
