module Main where

import Prelude
import Control.Monad.Eff
import Control.Monad.Eff.Console

import Immutable.List as IList
import Immutable.Record as IRecord
import Immutable.Utils (unsafeShow)
import Utils
import Data.Maybe (fromMaybe)
import Data.List (List(..), toList, (:))
import Data.Array as Array

-- type Record =
--   { a :: String
--   , b :: Int
--   }
--
-- type ExampleRecordType =
--   ( a :: String
--   , b :: Int
--   )
--
-- -- rec :: ImmutableRecord.ImmutableRecord ExampleRecordType
-- -- rec = ImmutableRecord.makeRecord { a: "hello from PS", b: 99 }
--
-- -- nums :: Array Int
-- -- nums = Data.Array.range 1 10
--
-- main :: forall e. Eff (console :: CONSOLE | e) Unit
-- main =
--   "Test" |> log
-- -- List example
--   -- Data.Array.range 1 10
--   -- |> ImmutableList.makeList
--   -- |> ImmutableList.push 99
--   -- |> ImmutableList.set 0 5
--   -- |> unsafeShow
--   -- |> log
-- -- Record example
--   -- ImmutableRecord.makeRecord { a: "hello from PS", b: 99 }
--   -- |> ImmutableRecord.set { a: "modified message", b: 12 }
--   -- |> ImmutableRecord.setField "b" 123
--   -- |> ImmutableRecord.getString "a"
--   -- |> fromMaybe "error: no message"
--   -- -- |> unsafeShow
--   -- |> show
--   -- |> log

type CommitMessageRecord =
  ( pendingCommit :: PendingCommit
  , unstagedFiles :: FileList
  )

type PendingCommitRecord =
  ( summary :: String
  , message :: String
  , amendPreviousCommit :: Boolean
  , stagedFiles :: FileList
  )

type CommitMessage = IRecord.ImmutableRecord CommitMessageRecord
type PendingCommit = IRecord.ImmutableRecord PendingCommitRecord
type FileList = IList.ImmutableList String

createStore :: CommitMessage
createStore = IRecord.makeRecord
  { pendingCommit: IRecord.makeRecord
    { summary: ""
    , message: ""
    , amendPreviousCommit: false
    , stagedFiles: IList.makeList []
    }
  , unstagedFiles: IList.makeList []
  }

loadUnstagedFiles :: Array String -> CommitMessage -> CommitMessage
loadUnstagedFiles files record =
  IRecord.setField "unstagedFiles" immutableFiles record
  where
    immutableFiles = IList.makeList files

summaryChanged :: String -> CommitMessage -> CommitMessage
summaryChanged = updateFieldInPending "summary"

messageChanged :: String -> CommitMessage -> CommitMessage
messageChanged = updateFieldInPending "message"

setAmendCommit :: Boolean -> CommitMessage -> CommitMessage
setAmendCommit = updateFieldInPending "amendPreviousCommit"

fileStaged :: String -> CommitMessage -> CommitMessage
fileStaged file store =
  updateFieldInPending "stagedFiles" updatedStagedFileList store
  |> IRecord.setField "unstagedFiles" unstagedWithoutFile
  where
    unstagedWithoutFile = IList.filterNot (\f -> f == file) existingUnstaged
    existingUnstaged = IRecord.getField "unstagedFiles" store :: FileList
    updatedStagedFileList = IList.push file fileList
    fileList = IRecord.getField "stagedFiles" commit :: FileList
    commit = IRecord.getField "pendingCommit" store :: PendingCommit


updateFieldInPending :: forall t. String -> t -> CommitMessage -> CommitMessage
updateFieldInPending field value store =
  IRecord.setField "pendingCommit" updatedCommit store
  where
    commit = IRecord.getField "pendingCommit" store :: PendingCommit
    updatedCommit = IRecord.setField field value commit

-- main = "test" |> log


-- import Control.Monad.Eff.Ref
-- import Signal
-- import Signal.Channel
--
-- data Action
--   = GetCurrentState
--   | SetInitialUnstagedFiles (Array String)
--   | SetFileToStaged String
--   | UpdateSummary String
--   | UpdateMessage String
--   | UpdateAmendStatus Boolean
--
-- data Action
--   = None
--   | AddMessage
--   | RemoveMessage
--
-- -- hello :: Signal String
-- -- hello = constant "Hello Joe!"
-- --
-- --
-- -- helloEffect = hello ~> log
--
-- type StoreState = Array String
-- initialState :: StoreState
-- initialState = ["starting string"]
--
-- step :: Action -> StoreState -> StoreState
-- step None state = state
-- step AddMessage state = Array.cons "New message" initialState
-- step RemoveMessage state = Array.tail state |> fromMaybe []
--
-- -- main :: forall e. Eff (console :: CONSOLE | e) Unit
-- -- main = runSignal helloEffect
-- main = do
--   channel <- channel None
--   let actions = subscribe channel
--   let storeState = foldp step initialState actions
--   send channel AddMessage
--   let store = storeState ~> show >>> log
--   --   mkEnv channel >>> (\env -> render (ui env) body') >>> void
--   --
--   runSignal store
