module.exports = ( path, data, config ) ->

   #######################################
   #|
   #|   @params {string} options.path
   #|   @params {object} options.data
   #|   @params {object} options.config
   #|
   ########################################

   return @send({ method: 'delete', path, data, config })