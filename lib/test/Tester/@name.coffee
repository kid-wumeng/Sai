errors     = require('../../errors')
error      = require('../../core/error')
isString   = require('../../is/isString')


module.exports = ( name ) ->

   ########################################
   #|
   #|   SET
   #|      @params {string}     name
   #|      @return {sai.Tester} @
   #|
   #|   GET
   #|      @return {string} name
   #|
   ########################################

   if name and !isString(name)
      throw error({ name: errors.INVALID_PARAMS, message: "`name` should be a string." })

   if name
      @_name = name
      return @
   else
      return @_name