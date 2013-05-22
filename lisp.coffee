tokenize = (input) ->
  input
    .replace(/\(/g, " ( ")
    .replace(/\)/g, " ) ")
    .split(' ')
    .filter (token) -> token != ''

readFrom = (tokens) ->
  token = tokens.shift()
  if token == '('
    ret = []
    until tokens[0] == ')'
      ret.push readFrom tokens
    tokens.shift()
    ret
  else
    atom token
 
atom = (token) ->
  if parseInt token then parseInt token else token

parse = (input) -> readFrom tokenize input

evaluate = (x) ->
  if typeof x == 'number'
    x
  else if typeof x == 'string'
    env[x]
  else if x[0] == 'set!'
    [_, varName, exp] = x
    env[varName] = evaluate exp
  else if x[0] == 'begin'
    for exp in x[1..]
      val = evaluate exp
    val
  else
    args = (evaluate(exp) for exp in x[1..])
    env[x[0]].apply {}, args

ev = (input) -> evaluate parse input

env =
  '+': (a, b) -> a + b

exports.tokenize = tokenize
exports.parse = parse
exports.atom = atom
exports.evaluate = evaluate
exports.ev = ev
