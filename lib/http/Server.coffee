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

      @router[method]( path, mid )

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

         await @_runCallback(ctx, callback, next)





   _wrapContent: ( ctx ) =>

      ########################################
      #|
      #|   Wrap a context from koa's context.
      #|
      #|   @params {object} koa-ctx
      #|   @return {object} ctx
      #|
      ########################################

      if ctx._hasWrapContext is undefined

         ctx._hasWrapContext = true

         ctx.data = @_getRequestData(ctx)

         Object.assign(ctx, @_mounts)

      return ctx





   _getRequestData: ( ctx ) =>

      ########################################
      #|
      #|   Get the data from query(GET) or body(non-GET)
      #|
      #|   @params {object} ctx
      #|   @return {object} data
      #|
      ########################################

      if ctx.method is 'GET'
         return ctx.query        ? {}
      else
         return ctx.request.body ? {}





   _runCallback: ( ctx, callback, next ) =>

      ########################################
      #|
      #|   Run the callback to handle request and response.
      #|
      #|   @params {object}         ctx
      #|   @params {function}       callback(data)
      #|   @params {async-function} next()
      #|
      ########################################

      try

         body = await callback.call(ctx, ctx.data, next)

         if ctx._hasReture is undefined
            ctx._hasReture = true
            ctx.body = body ? {}

      catch error
         ctx.error = error

      return





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