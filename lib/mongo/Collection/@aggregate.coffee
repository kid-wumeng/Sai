errors   = require('../../errors')
error    = require('../../core/error')
isArray  = require('../../is/isArray')
isObject = require('../../is/isObject')


module.exports = ( pipeline, options = {} ) ->

   #######################################
   #|
   #|   @params {object[]} pipeline
   #|   @params {object}   opt
   #|
   #|   @return {object[]} results
   #|
   ########################################

   if !isArray( pipeline )
      throw error({ name: errors.INVALID_PARAMS, message: "`pipeline` should be an Array" })

   if !isObject( options )
      throw error({ name: errors.INVALID_PARAMS, message: "`options` should be an object" })

   return await @_col.aggregate( pipeline, options ).toArray()