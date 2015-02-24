processor = require '../src/processor'

describe 'count', ->

  it 'works for arrays', ->
    expect(processor.count([1,2,3])).toBe(3)

  it 'works for empty arrays', ->
    expect(processor.count([])).toBe(0)

  it 'works for an object', ->
    expect(processor.count({})). toBe(1)

  it 'works for null or undefined', ->
    expect(processor.count(null)).toBe(0)
    expect(processor.count(undefined)).toBe(0)

