errors   = require('../../errors')
error    = require('../../core/error')
isString = require('../../is/isString')


module.exports = ( path = '' ) ->

   #######################################
   #|
   #|   @params {string} path
   #|   @return {string} url
   #|
   ########################################

   if !isString( path )
      throw error({ name: errors.INVALID_PARAMS, message: "`path` should be a string" })

   base = @_urlBase + '/'

   base = base.replace(/\/+$/, '')
   path = path.replace(/^\/+/, '')

   return "#{base}/#{path}"