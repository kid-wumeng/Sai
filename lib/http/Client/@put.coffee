module.exports = ( path, data, config ) ->

   #######################################
   #|
   #|   @params {string} path
   #|   @params {object} data
   #|   @params {object} config
   #|
   #|   @return {object} response
   #|
   ########################################

   return await @send({ method: 'put', path, data, config })