merge = require('lodash/merge')


module.exports = ( objects... ) ->


   ########################################
   #|
   #|   @params {object} objects
   #|   @return {object} newObject
   #|
   ########################################


   return merge({}, objects...)