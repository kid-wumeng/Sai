between = require('./between')



module.exports = from = ( start ) =>

   ########################################
   #|
   #|  Count the duration from start.
   #|
   #|  @params {Date}   start
   #|  @return {object} duration - the attributes same as time.between()
   #|
   ########################################

   return between( start, new Date() )