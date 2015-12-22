// module Immutable.Utils

exports._maybeUndefined = function (just, nothing, v) {
  return v === undefined ? nothing : just(v);
};

exports.unsafeShow = function (obj) {
  return String(obj);
};

exports._unsafeEq = require('immutable').is;
