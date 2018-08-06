module.exports = ->

   #######################################
   #|
   #|   @return {int ≥ 0} allSeconds
   #|
   ########################################

   return Math.ceil(@allMilliSeconds() / 1000)