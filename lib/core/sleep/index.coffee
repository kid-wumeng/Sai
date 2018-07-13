module.exports = ( ms = 0 ) ->


   ########################################
   #|
   #|   @params {number} ms
   #|
   ########################################


   await new Promise((resolve) => setTimeout(resolve, ms))