isEmail  = require('validator/lib/isEmail')
isString = require('../isString')


module.exports = ( string ) ->


   ########################################
   #|
   #|   @params {*}       string
   #|   @return {boolean} result
   #|
   ########################################


   return isString(string) and isEmail(string)