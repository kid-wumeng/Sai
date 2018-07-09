Client = require('./Client')





module.exports = post = ( url, data, opt ) =>

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

   return client.post( url, data, opt )