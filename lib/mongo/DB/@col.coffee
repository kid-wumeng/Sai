errors     = require('../../errors')
error      = require('../../core/error')
isString   = require('../../is/isString')
Collection = require('../Collection')


module.exports = ( name ) ->

   ########################################
   #|
   #|   @params {string} name
   #|
   ########################################

   if !isString(name)
      throw error({ name: errors.INVALID_PARAMS, message: "`name` should be a string" })

   if !@_cols[name]
       @_cols[name] = new Collection(@, name)

   return @_cols[name]