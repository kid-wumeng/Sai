errors      = require('../../errors')
error       = require('../../core/error')
isArrayLike = require('../../is/isArrayLike')
isN         = require('../../is/isN')


module.exports = ( array, i ) ->

   ########################################
   #|
   #|   @params {Array-like} array
   #|   @return {*|*[]}      item|items
   #|
   ########################################

   if !isArrayLike(array)
      throw error({ name: errors.INVALID_PARAMS, message: "`array` should be an Array-like" })

   if !isN(i)
      throw error({ name: errors.INVALID_PARAMS, message: "`i` should be a natural-number" })

   [].splice.call(array, i, 1)

   return