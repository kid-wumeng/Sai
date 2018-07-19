lodashRandom = require('lodash/random')
isNumber     = require('../../is/isNumber')
switch_      = require('../switch')



module.exports = ( args... ) ->

   ########################################
   #|
   #|   @params {*}        arguments...
   #|   @return {int ≥ 0} len
   #|
   ########################################

   return switch_(args)
      .case().then(-> _random(0, 100))
      .case(Number).then(-> _random(0, args[0]))
      .case(Number, Number).then(-> _random(args[0], args[1]))
      .default(0)
      .result()



_random = ( min, max ) ->
   min = parseInt(min)
   max = parseInt(max)
   return lodashRandom(min, max)