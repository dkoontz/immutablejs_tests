import * as Immutable from "immutable";

export interface CommitMessage
{
  summary : string;
  message : string;
  amendPreviousCommit : boolean;
  stagedFiles : Immutable.List<string>;
}

export interface State
{
    pendingCommit : Immutable.Record.IRecord<CommitMessage>;
    unstagedFiles : Immutable.List<string>;
}

export type CommitStoreRecord = Immutable.Record.IRecord<State>;
