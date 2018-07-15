isString    = require('../../is/isString')
isArrayLike = require('../../is/isArrayLike')
isEqual     = require('../../is/isEqual')


module.exports = ( arrayLike, value, fromIndex = 0 ) ->

   ########################################
   #|
   #|   @params {Array-like} arrayLike
   #|   @params {*}          value
   #|   @params {0, int+}    [fromIndex = 0]
   #|
   #|   @return {0, int+}    index
   #|
   ########################################

   if isString(arrayLike) and isString(value)
      return arrayLike.indexOf(value, fromIndex)

   if isArrayLike(arrayLike)

      arrayLike = [].slice.call(arrayLike, fromIndex)

      for item, i in arrayLike
          if isEqual(item, value)
             return fromIndex + i

   return -1