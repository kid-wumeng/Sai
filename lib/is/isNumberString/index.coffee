isString = require('../isString')


module.exports = ( value ) ->


   ########################################
   #|
   #|   @params {*}       value
   #|   @return {boolean} result
   #|
   ########################################


   if isString(value)
      return /^-?\d+(\.\d+)?$/.test(value)
   else
      return false