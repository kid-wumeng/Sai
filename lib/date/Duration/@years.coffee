module.exports = ->

   #######################################
   #|
   #|   @return {int ≥ 0} seconds
   #|
   ########################################

   fromTime = @_from.getTime()
   toTime   = @_to.getTime()

   return toTime - fromYear