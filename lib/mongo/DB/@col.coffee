Collection = require('../Collection')


module.exports = ( name ) ->

   ########################################
   #|
   #|   @params {string} name
   #|
   ########################################

   return new Collection(@, name)