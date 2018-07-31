module.exports = ( name ) ->

   ########################################
   #|
   #|   @params {string} name
   #|   @return {string} name
   #|
   ########################################

   if @_name
      return "`" + @_name + "`"
   else
      return "data"