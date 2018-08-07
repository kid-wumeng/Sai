axios    = require('axios')
errors   = require('../../errors')
error    = require('../../core/error')
merge    = require('../../core/merge')
isString = require('../../is/isString')
isObject = require('../../is/isObject')


module.exports = ( options = {} ) ->


   #######################################
   #|
   #|   @params {object} options
   #|           {string} options.method
   #|           {string} options.path
   #|           {object} options.data
   #|           {object} options.config
   #|
   ########################################


   if !isObject(options)
      throw error({ name: errors.INVALID_PARAMS, message: "`options` should be an object" })


   method = options.method ? 'get'
   path   = options.path   ? ''
   data   = options.data   ? {}
   config = options.config ? {}


   if !isString( method )
      throw error({ name: errors.INVALID_PARAMS, message: "`options.method` should be a string" })

   if !isString( path )
      throw error({ name: errors.INVALID_PARAMS, message: "`options.path` should be a string" })

   if !isObject( data )
      throw error({ name: errors.INVALID_PARAMS, message: "`options.data` should be an object" })

   if !isObject( config )
      throw error({ name: errors.INVALID_PARAMS, message: "`options.config` should be an object" })


   url = @url( path )


   if method is 'get' or method is 'delete'
      params = data
      data   = {}
   else
      params = {}


   options = merge({ method, url, data, params }, config)


   return axios(options)