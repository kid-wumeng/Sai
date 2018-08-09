isInteger = require('lodash/isInteger')
isNumber  = require('../isNumber')


module.exports = ( value ) ->


   ########################################
   #|
   #|   @params {*}       value
   #|   @return {boolean} result
   #|
   ########################################


   if typeof(value) is 'object'
      if value instanceof Number
         value = value.valueOf()


   return isNumber(value) and !isInteger(value)