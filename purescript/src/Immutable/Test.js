// module Test

// exports.mod = require ('immutable').List;
const List = require('immutable').List;

exports.plusNine = function (num) { return 9 + num; };
// exports.makeList = function() { return exports.mod([1,2,3]); };
exports.makeList = function() { return List([1,2,3]); };
exports.length = function(list) { return list.length; };
