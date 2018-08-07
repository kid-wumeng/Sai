Duration = require('../Duration')


module.exports = ( from, to ) =>

   ########################################
   #|
   #|   @params {Date} from
   #|   @params {Date} to
   #|
   #|   @return {sai.Duration}
   #|
   ########################################

   return new Duration(from, to)