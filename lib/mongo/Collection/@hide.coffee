errors   = require('../../errors')
error    = require('../../core/error')
isString = require('../../is/isString')


module.exports = ( name ) ->

   ########################################
   #|
   #|   @params {string} name
   #|
   ########################################

   if !isString(name)
      throw error({ name: errors.INVALID_PARAMS, message: "`name` should be a string" })

   @_hides.push(name)