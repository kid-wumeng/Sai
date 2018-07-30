isEmail  = require('validator/lib/isEmail')
isString = require('../isString')


module.exports = ( value ) ->


   ########################################
   #|
   #|   @params {*}       value
   #|   @return {boolean} result
   #|
   ########################################


   return isString(value) and isEmail(value)