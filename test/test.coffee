{ev, tokenize, parse, atom} = require '../lisp'
_ = require 'underscore'
assert = require 'assert'

describe 'ev', ->
  it 'should ev a single interger input to be an int', ->
    assert.equal 2, ev '2'
  it 'should ev (+ 1 2) to be 3', ->
    assert.equal 3, ev '(+ 1 2)'
  it 'should ev (+ 1 (+ 1 1)) to be 3', ->
    assert.equal 3, ev '(+ 1 (+ 1 1))'

  describe 'begin', ->
    it 'should return 2 for a series of statements ending with (+ 1 1)', ->
      assert.deepEqual 2, ev '(begin (+ 1 2) (+ 100 2) (+ 1 1))'

  describe 'set!', ->
    it 'should set a variable that can be used later', ->
      ev '(set! x 3)'
      assert.equal 3, ev 'x'


describe 'tokenize', ->
  it 'should tokenize 2 as ["2"]', ->
    res = tokenize "2"
    assert res.length == 1
    assert res[0] = "2"
  it 'should tokenize (+ 1 2) as ["(", "+", "1", "2", ")"]', ->
    assert _.isEqual tokenize('(+ 1 2)'), ['(', '+', '1', '2', ')']

describe 'parse', ->
  it 'should make (+ 1 2) into ["(", "+", "1", "2")"]', ->
    assert.deepEqual parse("(+ 1 2)"), ["+", 1, 2]
  it 'should make (begin (+ 1 2) (+ 100 2) (+ 1 1)) into ["begin", ["+", 1, 2], ["+", 100, 2], ["+", 1 ,1]]', ->
    assert.deepEqual parse('(begin (+ 1 2) (+ 100 2) (+ 1 1))'), ["begin", ["+", 1, 2], ["+", 100, 2], ["+", 1, 1]]

describe 'atom', ->
  it 'should return an int when the token is an int', ->
    assert 2, atom "2"
  it 'should return the literal token value otherwise', ->
    assert '+', atom '+'
