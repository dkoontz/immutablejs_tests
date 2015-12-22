import * as Immutable from "immutable";
import { State, CommitMessage, CommitStoreRecord } from "./interfaces";

export module CommitMessageStore
{
  const CommitMessageRecord = Immutable.Record<CommitMessage>({
    summary: "Default summary",
    message: "Default message",
    amendPreviousCommit: false,
    stagedFiles: Immutable.List<string>()
  }, "CommitMessage");

  const StateRecord = Immutable.Record<State>({
    pendingCommit: CommitMessageRecord(),
    unstagedFiles:Immutable.List<string>()
  }, "State");

  let storeData = StateRecord();

  export function loadUnstagedFiles(files : Array<string>) : void
  {
    storeData = storeData.set("unstagedFiles", Immutable.fromJS(files));
  }

  export function get() : CommitStoreRecord
  {
    return storeData;
  }

  export function summaryChanged(text : string) : void
  {
    storeData =
      storeData.set(
        'pendingCommit',
        storeData.pendingCommit.set('summary', text));
  }

  export function messageChanged(text : string) : void
  {
    storeData =
      storeData.set(
        'pendingCommit',
        storeData.pendingCommit.set('message', text));
  }

  export function setAmendCommit(status : boolean) : void
  {
    storeData =
      storeData.set(
        'pendingCommit',
        storeData.pendingCommit.set('amendPreviousCommit', status));
  }

  export function fileStaged(file : string) : void
  {
    let stagedFiles = storeData.pendingCommit.stagedFiles.push(file);
    let unstagedFiles = storeData.unstagedFiles.filter(f => f != file);

    storeData = storeData.set('pendingCommit', storeData.pendingCommit.set('stagedFiles', stagedFiles));
    storeData = storeData.set('unstagedFiles', unstagedFiles);
  }
}
