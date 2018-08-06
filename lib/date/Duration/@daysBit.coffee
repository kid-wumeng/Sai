module.exports = ->

   ########################################
   #|
   #|   @return {int ≥ 0} seconds
   #|
   ########################################

   # @TODO 现在是近似解，应该改为精确解

   return parseInt(@days(true) % 30)