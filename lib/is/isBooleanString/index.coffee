isString = require('../isString')


module.exports = ( value ) ->


   ########################################
   #|
   #|   @params {*}       value
   #|   @return {boolean} result
   #|
   ########################################


   if isString(value)
      return value is 'true' or value is 'false'
   else
      return false