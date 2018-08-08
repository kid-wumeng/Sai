axios    = require('axios')
errors   = require('../../errors')
error    = require('../../core/error')
merge    = require('../../core/merge')
isObject = require('../../is/isObject')
isString = require('../../is/isString')


module.exports = ( options = {} ) ->


   #######################################
   #|
   #|   @params {object} options
   #|           {string} options.method
   #|           {string} options.path
   #|           {object} options.data
   #|           {object} options.config
   #|
   #|   @return {object} response
   #|
   ########################################


   if !isObject(options)
      throw error({ name: errors.INVALID_PARAMS, message: "`options` should be an object" })


   method = options.method ? 'get'
   path   = options.path   ? ''
   data   = options.data   ? {}
   config = options.config ? {}


   if !isString( method )
      throw error({ name: errors.INVALID_PARAMS, message: "`method` should be a string" })

   if !isString( path )
      throw error({ name: errors.INVALID_PARAMS, message: "`path` should be a string" })

   if !isObject( data )
      throw error({ name: errors.INVALID_PARAMS, message: "`data` should be an object" })

   if !isObject( config )
      throw error({ name: errors.INVALID_PARAMS, message: "`config` should be an object" })


   url = @url( path )


   if method is 'get' or method is 'delete'
      params = data
      data   = {}
   else
      params = {}


   options = merge({ method, url, data, params }, config)


   return await axios(options)