module.exports = ->

   ########################################
   #|
   #|   @return {int ≥ 0} weeks
   #|
   ########################################

   return parseInt(@weeks(true) % 7)