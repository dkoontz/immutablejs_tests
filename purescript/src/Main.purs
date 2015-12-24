module Main where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console
import Data.List
-- import qualified Immutable.Map as IMap
-- import qualified Immutable.Utils as IUtils
-- import qualified Test as Test
import Utils

-- data Action
--   = GetCurrentState
--   | SetInitialUnstagedFiles (List String)
--   | SetFileToStaged String
--   | UpdateSummary String
--   | UpdateMessage String
--   | UpdateAmendStatus Boolean

type Foo =
  { fooName :: String
  , fooBar :: Bar
  , fooBaz :: Baz
  }

type Bar =
  { barName :: String
  , barBaz :: Baz
  }

type Baz =
  { bazNums :: List Int
  , bazCount :: Int
  }
--
-- type CommitMessage =
--   { summary :: String
--   , message :: String
--   , amendPreviousCommit :: Boolean
--   , stagedFiles :: List String
--   }
--
-- type State =
--   { pendingCommit :: CommitMessage
--   , unstagedFiles :: List String
--   }

makeBar :: String -> Baz -> Bar
makeBar name baz = { barName: name, barBaz: baz }

makeBaz :: List Int -> Int -> Baz
makeBaz nums count = { bazNums: nums, bazCount: count }

makeFoo :: String -> Bar -> Baz -> Foo
makeFoo name bar baz =
  { fooName: name
  , fooBar: bar
  , fooBaz: baz
  }

updateFooName :: Foo -> String -> Foo
updateFooName foo newName = foo { fooName = newName }

updateFooBar :: Foo -> Bar -> Foo
updateFooBar foo newBar = foo { fooBar = newBar }

updateFooBaz :: Foo -> Baz -> Foo
updateFooBaz foo newBaz = foo { fooBaz = newBaz }

updateBazCount :: Baz -> Int -> Baz
updateBazCount baz count = baz { bazCount = count }

updateBazNums :: Baz -> List Int -> Baz
updateBazNums baz nums = baz { bazNums = nums }

appendBazNums :: Baz -> Int -> Baz
appendBazNums baz num = baz { bazNums = newNums } where
  oldNums = baz.bazNums
  newNums = num : oldNums



-- makeCommitMessage :: String -> String -> Boolean -> CommitMessage
-- makeCommitMessage summary message ammend = { summary: summary, message: message, amendPreviousCommit: ammend, stagedFiles: Nil }
--
-- updateSummary :: CommitMessage -> String -> CommitMessage
-- updateSummary commit newMessage = commit { summary = newMessage }
--
-- getLength :: forall a. Test.ImmutableList a -> Number
-- getLength list = Test.length list

-- store :: IMap.Map String String
-- -- store = IMap.set IMap.empty "Foo" "Bar"
-- store = IMap.empty "test" "text"

main :: forall e. Eff (console :: CONSOLE | e) Unit
main = do
  "Test"
--   Test.makeList unit
--   |> getLength
--   |> show
  |> log
  -- IUtils.unsafeShow (store) |> log
