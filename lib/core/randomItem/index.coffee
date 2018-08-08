errors      = require('../../errors')
error       = require('../../core/error')
isArrayLike = require('../../is/isArrayLike')
isBoolean   = require('../../is/isBoolean')
random      = require('../random')
deleteItem  = require('../deleteItem')


module.exports = ( array, isPop = false ) ->


   ########################################
   #|
   #|   @params {Array-like} array
   #|   @return {*}          item
   #|
   ########################################


   if !isArrayLike(array)
      throw error_({ name: errors.INVALID_PARAMS, message: "`array` should be an Array-like" })

   if !isBoolean(isPop)
      throw error_({ name: errors.INVALID_PARAMS, message: "`isPop` should be a boolean" })


   if array.length

      i    = random(0, array.length - 1)
      item = array[i]

      if isPop
         deleteItem(array, i)

      return item

   else
      return