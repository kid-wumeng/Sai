errors = require('../../errors')
error  = require('../../core/error')
is_    = require('../../is/is')
Schema = require('../Schema')


module.exports = ( schema ) ->

   ########################################
   #|
   #|   SET
   #|      @params {sai.Schema} schema
   #|      @return {sai.Tester} @
   #|
   #|   GET
   #|      @return {sai.Schema} schema
   #|
   ########################################

   if schema and !is_(schema, Schema)
      throw error({ name: errors.INVALID_PARAMS, message: "`schema` should be a sai.Schema" })

   if schema
      @_schema = schema
      return @
   else
      return @_schema