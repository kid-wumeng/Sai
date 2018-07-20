isURL    = require('validator/lib/isURL')
isString = require('../isString')


module.exports = ( string ) ->


   ########################################
   #|
   #|   @params {*}       string
   #|   @return {boolean} result
   #|
   ########################################


   return isString(string) and isURL(string)