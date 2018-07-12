isN = require('../isN')


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


   return isN(value) and value isnt 0