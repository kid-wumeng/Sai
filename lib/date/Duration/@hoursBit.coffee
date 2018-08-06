module.exports = ->

   #######################################
   #|
   #|   @return {int ≥ 0} hours
   #|
   ########################################

   return parseInt(@hours(true) % 24)