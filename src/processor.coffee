_ = require('underscore')

processor =

  keys : _.keys
  first: _.first
  last: _.last
  where: _.where
  sortBy: _.sortBy
  sortByDesc: (data, name) -> @sortBy(data,name).reverse()

  pluck: (arr, keys) ->
    return _.pluck(arr, keys) unless keys instanceof Array
    _.map arr, (obj) -> _.pick(obj, keys)

  count: (c) ->
    return 0 unless c
    if c instanceof Array then c.length else 1

module.exports = processor
