Tester = require('../Tester')
Schema = require('../Schema')


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
   schema = new sai.Schema

   tester.schema(schema)

   return tester