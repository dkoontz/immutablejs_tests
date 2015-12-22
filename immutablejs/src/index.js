"use strict";

var Immutable = require('immutable');
var CommitMessageStore = require('./CommitMessageStore');

CommitMessageStore.loadUnstagedFiles(["foo.txt", "bar.js", "baz.css", "quux.html"]);
var commitMessageStore = CommitMessageStore.get();

CommitMessageStore.summaryChanged("New summary");
// CommitMessageStore.messageChanged("New message");
// CommitMessageStore.setAmendCommit(true);
// CommitMessageStore.fileStaged("bar.js");
var commitMessageStore2 = CommitMessageStore.get();

compareStores(commitMessageStore, commitMessageStore2);

console.log("commitMessageStore ========")
console.log(commitMessageStore);
console.log("commitMessageStore2 =======")
console.log(commitMessageStore2);

function compareStores(store1, store2)
{
  console.log("unsagedFiles: " + (store1.get('unstagedFiles') === store2.get('unstagedFiles') ? "same" : "changed"));
  console.log("pendingCommit: " + (store1.get('pendingCommit') === store2.get('pendingCommit') ? "same" : "changed"));
  console.log("  summary: " + (store1.get('pendingCommit').get('summary') === store2.get('pendingCommit').get('summary') ? "same" : "changed"));
  console.log("  message: " + (store1.get('pendingCommit').get('message') === store2.get('pendingCommit').get('message') ? "same" : "changed"));
  console.log("  amendPreviousCommit: " + (store1.get('pendingCommit').get('amendPreviousCommit') === store2.get('pendingCommit').get('amendPreviousCommit') ? "same" : "changed"));
  console.log("  stagedFiles: " + (store1.get('pendingCommit').get('stagedFiles') === store2.get('pendingCommit').get('stagedFiles') ? "same" : "changed"));
}
