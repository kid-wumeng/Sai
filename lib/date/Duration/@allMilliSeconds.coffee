module.exports = ->

   #######################################
   #|
   #|   @return {int ≥ 0} allMilliSeconds
   #|
   ########################################

   return @_to.getTime() - @_from.getTime()