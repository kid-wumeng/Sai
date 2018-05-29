Koa        = require('koa')
bodyParser = require('koa-bodyparser')
cors       = require('koa2-cors')
Router     = require('koa-router')



module.exports = class Server



   constructor: ( opt = {} ) ->

      ########################################
      #|
      #|   @params {object} opt
      #|           {bool}   opt.cors
      #|
      ########################################

      defaults =
         cors: false

      @opt     = Object.assign(defaults, opt)

      @app     = new Koa
      @router  = new Router

      @_mounts = {}





   ########################################
   #|
   #|   @params {string}   path
   #|   @params {function} callback(data)
   #|
   ########################################

   all:    ( path, callback ) => @_use('all',    path, callback)
   get:    ( path, callback ) => @_use('get',    path, callback)
   post:   ( path, callback ) => @_use('post',   path, callback)
   put:    ( path, callback ) => @_use('put',    path, callback)
   patch:  ( path, callback ) => @_use('patch',  path, callback)
   delete: ( path, callback ) => @_use('delete', path, callback)


   _use: ( method, path = '*', callback = -> ) =>

      ########################################
      #|
      #|   Register a route.
      #|
      #|   @params {string}   method
      #|   @params {string}   path
      #|   @params {function} callback(data)
      #|
      ########################################

      mid = @_wrapMiddleware(callback)

      @router[method](path, mid)

      return





   mount: ( name, value ) =>

      ########################################
      #|
      #|   Mount something to context.
      #|
      #|   @params {string} name
      #|   @params {*}      value
      #|
      #|   @return {Server} this
      #|
      ########################################

      @_mounts[name] = value

      return this





   _wrapMiddleware: ( callback ) =>

      ########################################
      #|
      #|   Wrap a callback to koa's middleware.
      #|
      #|   @params {function} callback(data)
      #|   @return {function} middleware(ctx, next)
      #|
      ########################################

      return ( ctx, next ) =>

         ctx = @_wrapContent(ctx)

         await @_runCallback(ctx, callback)





   _wrapContent: ( ctx ) =>

      ########################################
      #|
      #|   Wrap a context from koa's context.
      #|
      #|   @params {object} koa-ctx
      #|   @return {object} ctx
      #|
      ########################################

      ctx =
         raw: ctx
         req: {}
         res: {}

      Object.assign(ctx, @_mounts)

      return ctx





   _runCallback: ( ctx, callback ) =>

      ########################################
      #|
      #|   Run the callback to handle request and response.
      #|
      #|   @params {object}   ctx
      #|   @params {function} callback(data)
      #|
      ########################################

      try
         @_handleRequest(ctx)
         ctx.res.data = await callback.call(ctx, ctx.req.data)

      catch error
         @_handleError(ctx, error)

      finally
         @_handleResponse(ctx)

      return





   _handleRequest: ( ctx ) =>

      ########################################
      #|
      #|   @params {object} ctx
      #|
      ########################################

      ctx.req.method = ctx.raw.method
      ctx.req.data   = @_getRequestData(ctx)

      return





   _getRequestData: ( ctx ) =>

      ########################################
      #|
      #|   Get the data from query(GET) or body(non-GET)
      #|
      #|   @params {object} ctx
      #|   @return {object} data
      #|
      ########################################

      if ctx.raw.method is 'GET'

         return ctx.raw.query ? {}

      else

         return ctx.raw.request.body ? {}





   _handleError: ( ctx, error ) =>

      ########################################
      #|
      #|   @params {object} ctx
      #|   @params {*}      error
      #|
      ########################################

      ctx.res.data = error





   _handleResponse: ( ctx ) =>

      ########################################
      #|
      #|   @params {object} ctx
      #|
      ########################################

      ctx.raw.body   = ctx.res.data
      ctx.raw.status = ctx.res.status ? 200





   listen: ( port = 80 ) =>

      ########################################
      #|
      #|   Use common middlewares and start server.
      #|
      #|   @params {number} port
      #|
      ########################################

      # @TODO To handle by opt.cors and more opt.

      @app.use(cors())
      @app.use(bodyParser())
      @app.use(@router.routes())

      @app.listen(port)

      return