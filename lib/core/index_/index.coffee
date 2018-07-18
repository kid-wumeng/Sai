isString    = require('../../is/isString')
isArrayLike = require('../../is/isArrayLike')
equal       = require('../equal')


module.exports = ( array, item, fromIndex = 0 ) ->

   ########################################
   #|
   #|   @params {Array-like} array
   #|   @params {*}          item
   #|   @params {int ≥ 0}   [fromIndex = 0]
   #|
   #|   @return {int ≥ -1}  index
   #|
   ########################################

   if isString(array) and isString(item)
      return array.indexOf(item, fromIndex)

   if isArrayLike(array)
      array = [].slice.call(array, fromIndex)
      for value, i in array
          if equal(value, item)
             return fromIndex + i

   return -1