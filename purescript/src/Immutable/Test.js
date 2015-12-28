// module Test

// exports.mod = require ('immutable').List;
const List = require('immutable').List;

exports.makeList = function(list) { return List(list); };
exports.length = function(list) { return list.count(); };
exports._push = function(list, value) { return list.push(value); };
