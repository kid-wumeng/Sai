module.exports = ->

   #######################################
   #|
   #|   @return {int ≥ 0} minutes
   #|
   ########################################

   return parseInt(@minutes(true) % 60)