// module Immutable.Record

const Record = require('immutable').Record;

exports.makeRecord = function (keysAndDefaultValues) { return Record(keysAndDefaultValues)(); };
exports._get = function (key, record) { return errorIfUndefined(key, record.get(key)); };
exports._set = function (key, value, record) { return record.set(key, value); };
// exports._get = function(record, key) { return record.get(key); };
exports._merge = function (object, record) { return record.merge(object); };

function errorIfUndefined(key, value)
{
  if (value === undefined)
  {
    throw new Error('property ' + key + ' is not valid for this record');
  }

  return value;
}
