processor= require '../src/processor'
_ = require 'underscore'

describe 'keys', ->

  it 'works of an object', ->
    obj = {id:1, name: 'John', desc: 'blah'}
    keys = processor.keys(obj)
    expect(keys.length).toBe(3)
    expect(_.difference(keys,['id','name','desc']).length).toBe(0)
