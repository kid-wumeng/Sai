isString    = require('../../is/isString')
isArrayLike = require('../../is/isArrayLike')
equal       = require('../equal')


module.exports = ( array, value, fromIndex = 0 ) ->

   ########################################
   #|
   #|   @params {Array-like} array
   #|   @params {*}          value
   #|   @params {0, int+}    [fromIndex = 0]
   #|
   #|   @return {0, int+}    index
   #|
   ########################################

   if isString(array) and isString(value)
      return array.indexOf(value, fromIndex)

   if isArrayLike(array)
      array = [].slice.call(array, fromIndex)
      for item, i in array
          if equal(item, value)
             return fromIndex + i

   return -1