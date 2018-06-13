Client = require('./Client')





module.exports = patch = ( url, data, opt ) =>

   ########################################
   #|
   #|   @params {string}  url
   #|   @params {object}  data
   #|   @params {object}  opt
   #|
   #|   @return {Promise} axios-promise
   #|
   ########################################

   client = new Client()

   return client.patch( url, data, opt )