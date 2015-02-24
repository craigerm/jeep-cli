processor = require './processor'

builder =

  exec: (json, args) ->
    p = processor
    result = json
    result = p.where(result, args.where) if args.where
    result = p.sortBy(result, args.sortBy) if args.sortBy
    result = p.sortByDesc(result, args.sortByDesc) if args.sortByDesc
    result = p.pluck(result, args.pluck) if args.pluck
    result = p.keys(result) if args.keys
    result = p.first(result) if args.first
    result = p.last(result) if args.last

    # Count last 
    return processor.count(result) if args.count?
    return result

module.exports = builder
