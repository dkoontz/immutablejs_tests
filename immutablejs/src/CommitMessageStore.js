var Immutable = require ('immutable');

// PendingCommit ===========
// summary : string
// message : string
// amendPreviousCommit : bool
// stagedFiles : List<string>

// var storeData = Immutable.fromJS({
//   pendingCommit: {summary:"", message:"", amendPreviousCommit:false, stagedFiles:[]},
//   unstagedFiles: []
// });

const PendingCommit = Immutable.Record({
    summary: "",
    message: "",
    amendPreviousCommit: false,
    stagedFiles: Immutable.fromJS([])
});

const Store = Immutable.Record({
    pendingCommit: PendingCommit(),
    unstagedFiles: Immutable.fromJS([])
})

var storeData = Store();

// === previous version using a Map
// var storeData = Immutable.Map({
//   pendingCommit: {summary:"", message:"", amendPreviousCommit:false, stagedFiles:[]},
//   unstagedFiles: []
// });

const CommitMessageStore =
{
  loadUnstagedFiles: function(files)
  {
    storeData = storeData.set('unstagedFiles', Immutable.fromJS(files));
  },

  get: function()
  {
    return storeData;
  },

  summaryChanged: function(text)
  {
    storeData =
      storeData.set(
        'pendingCommit',
        storeData.pendingCommit.set('summary', text));
  },

  messageChanged: function(text)
  {
    storeData =
      storeData.set(
        'pendingCommit',
        storeData.pendingCommit.set('message', text));
  },

  setAmendCommit: function(status)
  {
    storeData =
      storeData.set(
        'pendingCommit',
        storeData.pendingCommit.set('amendPreviousCommit', status));
  },

  fileStaged: function(file)
  {
    var staged = storeData.pendingCommit.get('stagedFiles').push(file);
    var updatedPending = storeData.pendingCommit.set('stagedFiles', staged);
    var updatedUnstaged =
      storeData.unstagedFiles.filterNot(function(e) { return e === file });

    storeData =
      storeData.merge({
        'pendingCommit': updatedPending,
        'unstagedFiles': updatedUnstaged
      });
  }
};

module.exports = CommitMessageStore;
