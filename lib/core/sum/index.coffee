isArrayLike = require('../../is/isArrayLike')
isObject    = require('../../is/isObject')
isNumber    = require('../../is/isNumber')
switch_     = require('../switch')



module.exports = ( args... ) ->

   ########################################
   #|
   #|   @params {Set | Map | Array-like | object}
   #|   @return {number} sum
   #|
   ########################################

   sum = switch_(args)
      .case(Set).then(sumByForEach)
      .case(Map).then(sumByForEach)
      .case(isArrayLike).then(sumByForIn)
      .case(isObject).then(sumByForOf)
      .default(0)
      .result()

   # @TODO Review 浮点数运算的精度问题

   return parseFloat(sum.toFixed(10))



sumByForEach = ( array ) ->
   sum = 0
   array.forEach (value) ->
       if isNumber(value)
          sum += value
   return sum



sumByForIn = ( array ) ->
   sum = 0
   for value in array
       if isNumber(value)
          sum += value
   return sum



sumByForOf = ( object ) ->
   sum = 0
   for name, value of object
       if isNumber(value)
          sum += value
   return sum