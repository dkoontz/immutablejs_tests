module Main (main, module Test) where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console
import Data.List hiding (length)
-- import qualified Immutable.Map as IMap
-- import qualified Immutable.Utils as IUtils
import Test
import Utils

-- type Foo =
--   { fooName :: String
--   , fooBar :: Bar
--   , fooBaz :: Baz
--   }
--
-- type Bar =
--   { barName :: String
--   , barBaz :: Baz
--   }
--
-- type Baz =
--   { bazNums :: List Int
--   , bazCount :: Int
--   }
--
-- makeBar :: String -> Baz -> Bar
-- makeBar name baz = { barName: name, barBaz: baz }
--
-- makeBaz :: List Int -> Int -> Baz
-- makeBaz nums count = { bazNums: nums, bazCount: count }
--
-- makeFoo :: String -> Bar -> Baz -> Foo
-- makeFoo name bar baz =
--   { fooName: name
--   , fooBar: bar
--   , fooBaz: baz
--   }
--
-- updateFooName :: Foo -> String -> Foo
-- updateFooName foo newName = foo { fooName = newName }
--
-- updateFooBar :: Foo -> Bar -> Foo
-- updateFooBar foo newBar = foo { fooBar = newBar }
--
-- updateFooBaz :: Foo -> Baz -> Foo
-- updateFooBaz foo newBaz = foo { fooBaz = newBaz }
--
-- updateBazCount :: Baz -> Int -> Baz
-- updateBazCount baz count = baz { bazCount = count }
--
-- updateBazNums :: Baz -> List Int -> Baz
-- updateBazNums baz nums = baz { bazNums = nums }
--
-- appendBazNums :: Baz -> Int -> Baz
-- appendBazNums baz num = baz { bazNums = newNums } where
--   oldNums = baz.bazNums
--   newNums = num : oldNums

nums :: Array Int
nums = Data.Array.range 1 10

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  -- "Test"
  Test.makeList nums
  |> Test.length
  |> show
  |> log
  -- IUtils.unsafeShow (store) |> log
