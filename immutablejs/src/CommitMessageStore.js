var Immutable = require ('immutable');

// PendingCommit ===========
// summary : string
// message : string
// amendPreviousCommit : bool
// stagedFiles : List<string>

var storeData = Immutable.fromJS({
  pendingCommit: {summary:"", message:"", amendPreviousCommit:false, stagedFiles:[]},
  unstagedFiles: []
});

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
    storeData = storeData.setIn(['pendingCommit', 'summary'], Immutable.fromJS(text));
  },

  messageChanged: function(text)
  {
    storeData = storeData.setIn(['pendingCommit', 'message'], Immutable.fromJS(text));
  },

  setAmendCommit: function(ammendStatus)
  {
    storeData = storeData.setIn(['pendingCommit', 'amendPreviousCommit'], Immutable.fromJS(ammendStatus));
  },

  fileStaged: function(file)
  {
    var staged = storeData.getIn(['pendingCommit', 'stagedFiles']).push(file);
    var unstaged = storeData.get('unstagedFiles').filterNot(function(e) { return e === file });
    var temp = storeData.setIn(['pendingCommit', 'stagedFiles'], staged);
    storeData = temp.set('unstagedFiles', unstaged);
  }
};

module.exports = CommitMessageStore;
