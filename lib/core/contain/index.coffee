index       = require('../index_')
isString    = require('../../is/isString')
isArrayLike = require('../../is/isArrayLike')


module.exports = ( array, child ) ->

   ########################################
   #|
   #|   @params {Array-like} array
   #|   @params {*}          child
   #|
   #|   @return {boolean}    result
   #|
   ########################################

   if isArrayLike(array)
      return index(array, child) > -1

   return false