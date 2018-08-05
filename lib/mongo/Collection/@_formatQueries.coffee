errors   = require('../../errors')
error    = require('../../core/error')
clone    = require('../../core/clone')
isID     = require('../../is/isID')
isObject = require('../../is/isObject')


module.exports = ( queries = {} ) ->

   ########################################
   #|
   #|   @params {object | int ≥ 1} queries | doc's id
   #|   @return {object}            queries
   #|
   ########################################

   if isID(queries)
      queries = { id: queries }

   else if !isObject(queries)
      throw error({ name: errors.INVALID_PARAMS, message: "`queries` should be an object or doc's id" })

   return clone(queries)