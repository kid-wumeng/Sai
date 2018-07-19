isArrayLike = require('../../is/isArrayLike')


module.exports = ( array ) ->

   ########################################
   #|
   #|   @params {Array-like} array
   #|   @return {*}          item
   #|
   ########################################

   if isArrayLike(array)
      return array[0]
   else
      return undefined