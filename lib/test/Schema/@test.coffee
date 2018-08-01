Tester = require('../Tester')


module.exports = ( data, path ) ->

   ########################################
   #|
   #|   @params {*}      data
   #|   @params {string} [path]
   #|
   #|   @return {sai.Tester}
   #|
   ########################################

   tester = new Tester(data, path)

   tester.schema(@)

   return tester