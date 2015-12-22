// module Immutable.Vector

exports.mod = require('immutable').Vector;

exports.empty = mod.empty();

exports.length = function (v) {
  return v.length;
};

exports.first = function (v) {
  return v.first();
};

exports.rest = function (v) {
  return v.rest();
};

exports._get = function (maybeUndefined, v, idx) {
  return maybeUndefined(v.get(idx));
};

exports._set = function (v, idx, val) { return v.set(idx, val); };

exports._push = function (v, val) {
  return v.push(val);
};

exports._concat = function (v1, v2) {
  return v1.concat(v2);
};

exports.pop = function (v) {
  return v.pop();
};

exports._unshift = function (v, val) {
  return v.unshift(val);
};

exports._update = function (v, idx, f) {
  return v.update(idx, f);
};

exports._map = function (f, v) {
  return v.map(f);
};

exports._reduce = function (f, init, v) {
  return v.reduce(f, init);
};

exports._reduceRight = function (f, init, v) {
  return v.reduceRight(f, init);
};
