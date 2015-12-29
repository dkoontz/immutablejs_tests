// module Immutable.Utils

exports._undefinedToMaybe = function(nothing, justFn, value)
{
  return value === undefined ? nothing : justFn(value);
};

// exports._maybeUndefined = function (nothing, justFn, v) {
//   return v === undefined ? nothing : justFn(v);
// };

exports.unsafeShow = function (obj) {
  return String(obj);
};
//
// exports._unsafeEq = require('immutable').is;
