Client = require('./Client')





module.exports = del = ( url, data, opt ) =>

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

   return client.delete( url, data, opt )