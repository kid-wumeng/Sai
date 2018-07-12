isPlainObject = require('lodash/isPlainObject')


module.exports = ( value ) ->


   ########################################
   #|
   #|   @params {*}       value
   #|   @return {boolean} result
   #|
   ########################################


   return isPlainObject(value)