Client = require('./Client')





module.exports = get = ( url, data, opt ) =>

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

   return client.get( url, data, opt )