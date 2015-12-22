// module Immutable.Map

var Immutable = require('immutable').Map;

exports.mod = Immutable;

// exports.empty = mod.empty;

exports.empty = function () { return Immutable.Map({"foo":"bar"}); };

exports._get = function (maybeUndefined, m, k) { return maybeUndefined(m.get(k)); };

exports._set = function (m, k, v) { return m.set(k, v); };

exports._remove = function (m, k) { return m.remove(k); };

exports._update = function (m, k, f) { return m.update(k, f); };

exports._merge = function (m, om) { return m.merge(k, f); };

exports._map = function (f, m) {
  return m.map(f);
};
