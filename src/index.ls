'use strict'

{map, fold1} = require 'prelude-ls'

module.exports = (circuit, type) ->

  series = -> (^ -1) fold1 (+), (map (^ -1), &0)
  parallel = fold1 (+)

  switch type
  | \series   \s => series circuit
  | \parallel \p => parallel circuit
  | _            => 'Please enter a valid type of resistors association.'
