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

exports.tokenize = tokenize
exports.readFrom = readFrom
exports.atom = atom
