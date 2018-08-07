Client = require('../Client')


module.exports = ( url, data, config ) ->

   #######################################
   #|
   #|   @params {string} url
   #|   @params {object} data
   #|   @params {object} config
   #|
   #|   @return {object} response
   #|
   ########################################

   client = new Client

   return await client.patch( url, data, config )