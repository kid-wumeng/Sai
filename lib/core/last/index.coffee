isArrayLike = require('../../is/isArrayLike')


module.exports = ( array ) ->

   ########################################
   #|
   #|   @params {Array-like} array
   #|   @return {*}          item
   #|
   ########################################

   if isArrayLike(array)
      return array[array.length - 1]
   else
      return undefined