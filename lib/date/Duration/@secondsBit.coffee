module.exports = ->

   #######################################
   #|
   #|   @return {int ≥ 0} seconds
   #|
   ########################################

   return parseInt(@seconds(true) % 60)