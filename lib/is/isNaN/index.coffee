isNaN = require('lodash/isNaN')


module.exports = ( value ) ->


   ########################################
   #|
   #|   sai.isNaN(NaN)   // => true
   #|   sai.isNaN(null)  // => false
   #|
   #|   @params {*}       value
   #|   @return {boolean} result
   #|
   ########################################


   return isNaN(value)