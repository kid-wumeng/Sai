errors          = require('../../errors')
error           = require('../../core/error')
merge           = require('../../core/merge')
isObject        = require('../../is/isObject')
isString        = require('../../is/isString')
isFunction      = require('../../is/isFunction')
isBooleanString = require('../../is/isBooleanString')
isNumberString  = require('../../is/isNumberString')


module.exports = ( options = {} ) ->


   #######################################
   #|
   #|   @params {object}   options
   #|           {string}   options.method
   #|           {string}   options.path
   #|           {function} options.callback
   #|
   #|   @return {sai.http.Server} this
   #|
   ########################################


   if !isObject(options)
      throw error({ name: errors.INVALID_PARAMS, message: "`options` should be an object" })


   method   = options.method   ? 'get'
   path     = options.path     ? '*'
   callback = options.callback ? ->


   if !isString( method )
      throw error({ name: errors.INVALID_PARAMS, message: "`method` should be a string" })

   if !isString( path )
      throw error({ name: errors.INVALID_PARAMS, message: "`path` should be a string" })

   if !isFunction( callback )
      throw error({ name: errors.INVALID_PARAMS, message: "`callback` should be a function" })

   if !['all', 'get', 'post', 'put', 'patch', 'delete'].includes( method )
      throw error({ name: errors.INVALID_PARAMS, message: "`method` should be in ['all', 'get', 'post', 'put', 'patch', 'delete']" })


   if path[0] isnt '/'
      path = '/' + path


   @_router[method] path, ( ctx, next ) =>

      ctx.next = next
      ctx.data = _formatRequestData.call(@, ctx)

      data = await callback.call(ctx, ctx.data, ctx, next)

      if data isnt undefined
         ctx.body = data


   return @




_formatRequestData = ( ctx ) ->

   params = ctx.params       ? {}
   querys = ctx.query        ? {}
   body   = ctx.request.body ? {}

   _formatRequestParam.call(@, params)
   _formatRequestQuery.call(@, querys)

   return merge( params, querys, body )




_formatRequestParam = ( params ) ->

   if @_paramCastBoolean or @_paramCastNumber

      for name, value of params

          if @_paramCastBoolean and isBooleanString( value )
             if value is 'true'
                params[name] = true
             else
                params[name] = false

          if @_paramCastNumber and isNumberString( value )
               params[name] = parseFloat(value)




_formatRequestQuery = ( querys ) ->

   if @_queryCastBoolean or @_queryCastNumber

      for name, value of querys

          if @_queryCastBoolean and isBooleanString( value )
             if value is 'true'
                querys[name] = true
             else
                querys[name] = false

          if @_queryCastNumber and isNumberString( value )
               querys[name] = parseFloat(value)