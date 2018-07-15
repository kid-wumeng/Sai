isMatch     = require('lodash/isMatch')
index       = require('../../core/index')
isString    = require('../isString')
isArrayLike = require('../isArrayLike')
isObject    = require('../isObject')


module.exports = ( value, child ) ->

   ########################################
   #|
   #|   @params {object}  value
   #|   @params {*}       child
   #|
   #|   @return {boolean} result
   #|
   ########################################

   if isString(value) and isString(child)
      return index(value, child) > -1

   if isArrayLike(value)
      return index(value, child) > -1

   if isObject(value) and isObject(child)
      return isMatch(value, child)

   return false