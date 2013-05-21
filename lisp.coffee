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

exports.tokenize = tokenize
exports.parse = parse
exports.atom = atom
