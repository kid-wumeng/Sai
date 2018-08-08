module.exports = ( path, callback ) ->

   #######################################
   #|
   #|   @params {string}   path
   #|           {function} callback
   #|
   #|   @return {sai.http.Server} this
   #|
   ########################################

   return @_addRoute({ method: 'get', path, callback })