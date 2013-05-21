{evaluate, tokenize, parse, atom} = require '../lisp'
_ = require 'underscore'
assert = require 'assert'

describe 'evaluate', ->
  it 'should evaluate a single interger input to be an int', ->
    assert.equal 2, evaluate parse '2'
  it 'should evaluate (+ 1 2) to be 3', ->
    assert.equal 3, evaluate parse '(+ 1 2)'
  it 'should evaluate (+ 1 (+ 1 1)) to be 3', ->
    assert.equal 3, evaluate parse '(+ 1 (+ 1 1))'

describe 'tokenize', ->
  it 'should tokenize 2 as ["2"]', ->
    res = tokenize "2"
    assert res.length == 1
    assert res[0] = "2"
  it 'should tokenize (+ 1 2) as ["(", "+", "1", "2", ")"]', ->
    assert _.isEqual tokenize('(+ 1 2)'), ['(', '+', '1', '2', ')']

describe 'parse', ->
  it 'should make (+ 1 2) into ["(", "+", "1", "2", ")"]', ->
    assert parse("(+ 1 2)"), ["+", "1", "2"]

describe 'atom', ->
  it 'should return an int when the token is an int', ->
    assert 2, atom "2"
  it 'should return the literal token value otherwise', ->
    assert '+', atom '+'
