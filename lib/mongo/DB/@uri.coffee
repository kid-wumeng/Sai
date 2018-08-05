module.exports = ->

   ########################################
   #|
   #|   Format and return a mongo's uri, reference:
   #|      https://docs.mongodb.com/manual/reference/connection-string/
   #|
   #|   @return {string} uri
   #|
   ########################################

   if @_user
      return "mongodb://#{@_user}:#{@_pass}@#{@_host}:#{@_port}/#{@_name}"
   else
      return "mongodb://#{@_host}:#{@_port}/#{@_name}"