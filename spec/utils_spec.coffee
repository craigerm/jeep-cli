utils = require '../src/utils'

describe 'utils', ->

  describe '#toJson', ->

    it 'works for valid json input', ->
      expect(utils.toJson('{"id":1,"name":"John"}')).toBeNonEmptyObject()

    it 'works for json that is missing quotes', ->
      obj = utils.toJson('{id:1,name:"Steve"}')
      expect(obj).toBeNonEmptyObject()
      expect(obj.id).toBe(1)
      expect(obj.name).toBe('Steve')

  describe '#list', ->

    it 'returns empty array for blank values', ->
      expect(utils.list(null)).toBeEmptyArray()
      expect(utils.list('')).toBeEmptyArray()
      expect(utils.list(undefined)).toBeEmptyArray()

    it 'returns array for items', ->
      arr = utils.list('car,van,boat')
      expect(arr).toBeArrayOfSize(3)
      expect(arr[0]).toBe('car')
      expect(arr[1]).toBe('van')
      expect(arr[2]).toBe('boat')

    it 'removes whitespace', ->
      arr = utils.list(' dog   , cat    ')
      expect(arr).toBeArrayOfSize(2)
      expect(arr[0]).toBe('dog')
      expect(arr[1]).toBe('cat')


