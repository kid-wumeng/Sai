isString = require('../isString')


module.exports = ( string ) ->


   ########################################
   #|
   #|   @params {*}       string
   #|   @return {boolean} result
   #|
   ########################################


   return isString(string) and /^\s*$/.test(string)