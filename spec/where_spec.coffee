processor = require '../src/processor'

describe 'where', ->

  arr = [
    {id: 1, name: 'John', role: 'author'}
    {id: 2, name: 'Steve', role: 'admin'}
    {id: 3, name: 'Mike', role: 'author'}
  ]

  it 'filters based on property value', ->
    results = processor.where arr, {role: 'author'}
    expect(results.length).toBe(2)

  it 'returns empty array if no match', ->
    results = processor.where arr, {role: 'zzzz'}
    expect(results.length).toBe(0)

