module.exports = ->

   #######################################
   #|
   #|   @return {int ≥ 0} allHours
   #|
   ########################################

   return Math.ceil(@allMinutes() / 60)