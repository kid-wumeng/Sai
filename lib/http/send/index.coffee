Client = require('../Client')


module.exports = ( options ) ->

   #######################################
   #|
   #|   @params {object} options
   #|           {string} options.method
   #|           {string} options.path
   #|           {object} options.data
   #|           {object} options.config
   #|
   #|   @return {object} response
   #|
   ########################################

   client = new Client

   return await client.send(options)