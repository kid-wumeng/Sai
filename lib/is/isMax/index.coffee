len      = require('../../core/len')
isNumber = require('../isNumber')
isString = require('../isString')
isBuffer = require('../isBuffer')


module.exports = ( value, max ) ->

   ########################################
   #|
   #|   @params {*}       value
   #|   @params {number}  max
   #|
   #|   @return {boolean} result
   #|
   ########################################

   if !isNumber(max)
      return false

   switch
      when isNumber(value) then     value  <= max
      when isString(value) then len(value) <= max
      when isBuffer(value) then len(value) <= max
      else false