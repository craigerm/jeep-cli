processor = require '../src/processor.coffee'

describe 'sort', ->

  describe 'sort asc', ->
    it 'works for collection', ->
      arr = [{id:200},{id:500},{id:100}]
      arr = processor.sortBy(arr, 'id')
      expect(arr[0].id).toBe(100)
      expect(arr[1].id).toBe(200)
      expect(arr[2].id).toBe(500)

  describe 'sort desc', ->
    it 'works for collection', ->
      arr = [{id:200},{id:500},{id:100}]
      arr = processor.sortByDesc(arr, 'id')
      expect(arr[0].id).toBe(500)
      expect(arr[1].id).toBe(200)
      expect(arr[2].id).toBe(100)
