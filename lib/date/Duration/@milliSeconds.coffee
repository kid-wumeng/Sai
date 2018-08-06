module.exports = ->

   ########################################
   #|
   #|   @return {int ≥ 0} milliSeconds
   #|
   ########################################

   return @_to.getTime() - @_from.getTime()