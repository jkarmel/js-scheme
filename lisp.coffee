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
    fns[x[0]].apply {}, x[1..]

fns =
  '+': (a, b) -> a + b

exports.tokenize = tokenize
exports.parse = parse
exports.atom = atom
exports.evaluate = evaluate
