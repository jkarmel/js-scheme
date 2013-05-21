parse = require '../lisp'
assert = require 'assert'

describe 'parse', ->
  it 'should evaluate a single interger input to be an int', ->
    assert.equal 2, parse '2'
