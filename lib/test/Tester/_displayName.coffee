module.exports = ( name ) ->

   ########################################
   #|
   #|   @params {string} name
   #|   @return {string} name
   #|
   ########################################

   if name
      return "`" + name + "`"
   else
      return "data"