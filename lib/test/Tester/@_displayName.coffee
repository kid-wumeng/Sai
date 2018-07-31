module.exports = ->

   ########################################
   #|
   #|   @return {string} `name` | data
   #|
   ########################################

   if @_name
      return "`" + @_name + "`"
   else
      return "data"