len      = require('../../core/len')
isNumber = require('../isNumber')
isString = require('../isString')
isBuffer = require('../isBuffer')


module.exports = ( value, min ) ->

   ########################################
   #|
   #|   @params {*}       value
   #|   @params {number}  min
   #|
   #|   @return {boolean} result
   #|
   ########################################

   if !isNumber(min)
      return false

   switch
      when isNumber(value) then     value  >= min
      when isString(value) then len(value) >= min
      when isBuffer(value) then len(value) >= min
      else false