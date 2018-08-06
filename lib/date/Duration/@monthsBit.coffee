module.exports = ->

   #######################################
   #|
   #|   @return {int ≥ 0} months
   #|
   ########################################

   return parseInt(@months(true) % 12)