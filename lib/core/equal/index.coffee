isEqual = require('lodash/isEqual')


module.exports = ( value, otherValue ) ->

   ########################################
   #|
   #|   @params {*}       value
   #|   @params {*}       otherValue
   #|
   #|   @return {boolean} result
   #|
   ########################################

   return isEqual(value, otherValue)