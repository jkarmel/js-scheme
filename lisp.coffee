tokenize = (input) ->
  input
    .replace(/\(/g, " ( ")
    .replace(/\)/g, " ) ")
    .split(' ')
    .filter (token) -> token != ''


exports.evaluate = evaluate
exports.tokenize = tokenize
