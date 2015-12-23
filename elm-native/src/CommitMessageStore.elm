module CommitMessageStore where

import Maybe exposing (..)

-- Incoming ports
port setUnstagedFiles : Signal (List String)
port getCurrentState : Signal (Maybe ())
port setFileToStaged : Signal String
port updateSummary : Signal String
port updateMessage: Signal String
port updateAmendStatus : Signal Bool

-- Outgoing ports
port currentState : Signal State
port currentState = Signal.foldp updateState initialState actionSignals

type Action
  = GetCurrentState
  | SetInitialUnstagedFiles (List String)
  | SetFileToStaged String
  | UpdateSummary String
  | UpdateMessage String
  | UpdateAmendStatus Bool

type alias CommitMessage =
  { summary : String
  , message : String
  , amendPreviousCommit : Bool
  , stagedFiles : List String
  }

type alias State =
  { pendingCommit : CommitMessage
  , unstagedFiles : List String
  }

initialState : State
initialState =
  { pendingCommit =
    { summary = "Default summary"
    , message = "Default message"
    , amendPreviousCommit = False
    , stagedFiles = []
    }
    , unstagedFiles = []
  }

actionSignals : Signal Action
actionSignals =
  Signal.mergeMany
    [
      Signal.map SetInitialUnstagedFiles setUnstagedFiles,
      Signal.map (\_ -> GetCurrentState) getCurrentState,
      Signal.map SetFileToStaged setFileToStaged,
      Signal.map UpdateSummary updateSummary,
      Signal.map UpdateMessage updateMessage,
      Signal.map UpdateAmendStatus updateAmendStatus
    ]

updateState : Action -> State -> State
updateState action state =
  case action of
    GetCurrentState ->
      state
    SetInitialUnstagedFiles files ->
      { state | unstagedFiles = files }
    SetFileToStaged file ->
      let
        pendingCommit' = state.pendingCommit
        -- unstagedFiles' = List.filter (\f -> f /= file) state.unstagedFiles
        unstagedFiles' = List.filter ((/=) file) state.unstagedFiles
        stagedFiles' = file :: state.pendingCommit.stagedFiles
      in
        { state | unstagedFiles = unstagedFiles'
                , pendingCommit = { pendingCommit' | stagedFiles = stagedFiles' }
        }
    UpdateSummary summary' ->
      let pendingCommit' = state.pendingCommit in
      { state | pendingCommit = { pendingCommit' | summary = summary' } }
    UpdateMessage message' ->
      let pendingCommit' = state.pendingCommit in
      { state | pendingCommit = { pendingCommit' | message = message' } }
    UpdateAmendStatus status ->
      let pendingCommit' = state.pendingCommit in
      { state | pendingCommit = { pendingCommit' | amendPreviousCommit = status } }
