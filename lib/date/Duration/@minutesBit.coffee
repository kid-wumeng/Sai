module.exports = ->

   #######################################
   #|
   #|   @return {int ≥ 0} seconds
   #|
   ########################################

   return parseInt(@allMilliSeconds() / 1000 / 60 % 60)