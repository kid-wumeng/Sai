Client = require('./Client')





module.exports = put = ( url, data, opt ) =>

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

   return client.put( url, data, opt )