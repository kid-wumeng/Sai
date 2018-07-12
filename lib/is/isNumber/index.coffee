isFinite = require('lodash/isFinite')


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


   return isFinite(value, Number)