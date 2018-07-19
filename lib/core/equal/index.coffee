isEqual = require('lodash/isEqual')


module.exports = ( data1, data2 ) ->

   ########################################
   #|
   #|   @params {*}       data1
   #|   @params {*}       data2
   #|
   #|   @return {boolean} result
   #|
   ########################################

   return isEqual(data1, data2)