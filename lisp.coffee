tokenize = (input) ->
  input
    .replace(/\(/g, " ( ")
    .replace(/\)/g, " ) ")
    .split(' ')
    .filter (token) -> token != ''

readFrom = (tokens) ->
  token = tokens.shift()
  if token == '('
    until tokens[0] == ')'
      readFrom tokens
  else
    atom token
 
atom = (token) ->
  if parseInt token then parseInt token else token

parse = (input) -> readFrom tokenize input

evaluate = (x) ->
  if typeof x == 'number'
    x
  else
    args = (evaluate(exp) for exp in x[1..])
    fns[x[0]].apply {}, args

fns =
  '+': (a, b) -> a + b

exports.tokenize = tokenize
exports.parse = parse
exports.atom = atom
exports.evaluate = evaluate
