index       = require('../index_')
isString    = require('../../is/isString')
isArrayLike = require('../../is/isArrayLike')


module.exports = ( array, item ) ->

   ########################################
   #|
   #|   @params {Array-like} array
   #|   @params {*}          item
   #|
   #|   @return {boolean}    result
   #|
   ########################################

   if isArrayLike(array)
      return index(array, item) > -1

   return false