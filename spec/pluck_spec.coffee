processor = require '../src/processor'
_ = require 'underscore'

describe 'pluck', ->

  describe 'on arrays', ->
    it 'works for a single property', ->
      arr = [{id: 1, name: 'John'},{id: 2, name: 'Steve'}]
      result = processor.pluck(arr, ['name'])
      expect(result.length).toBe(2)
      expect(result[0]).toBe('John')
      expect(result[1]).toBe('Steve')

    it 'works for multiple properties', ->
      arr = [{id: 1, name: 'John',score:1},{id: 2, name: 'Steve',score: 4}]
      result = processor.pluck(arr, ['id','score'])
      expect(result.length).toBe(2)
      expect(_.isEqual(result[0], id: 1, score: 1)).toBe(true)
      expect(_.isEqual(result[1], id: 2, score: 4)).toBe(true)

  describe 'on objects', ->

    it 'can pluck a property', ->
      obj = id:1, name: 'John', title: 'Director'
      result = processor.pluck(obj, ['title'])
      expect(_.isEqual(result, title: 'Director')).toBe(true)

    it 'can pluck multiple properties', ->
      obj = id:1, name: 'John', title: 'Director'
      result = processor.pluck(obj, ['name','title'])
      expect(_.isEqual(result, name: 'John', title: 'Director')).toBe(true)



