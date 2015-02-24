builder = require '../src/builder'

describe 'builder', ->
  it 'can count after filtering', ->
    arr = [
      {type: 'admin'}
      {type: 'admin'}
      {type: 'author'}
      {type: 'admin'}
      {type: 'guest'}
      {type: 'admin'}
    ]

    args =
      where:
        type: 'admin'
      count: true

    result = builder.exec(arr, args)
    expect(result).toBe(4)
