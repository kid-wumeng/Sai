Koa        = require('koa')
bodyParser = require('koa-bodyparser')
cors       = require('koa2-cors')
Router     = require('koa-router')
errors     = require('../../errors')
error      = require('../../core/error')
merge      = require('../../core/merge')
isN        = require('../../is/isN')


module.exports = ( port = 80 ) ->

   ########################################
   #|
   #|   Use common middlewares and start server.
   #|
   #|   @params {number} port
   #|
   ########################################

   if !isN( port )
      throw error({ name: errors.INVALID_PARAMS, message: "`port` should be a natural-number" })

   # @TODO To handle by opt.cors and more opt.

   # @_app.use(cors())
   # @_app.use(bodyParser())
   # @_app.use(@router.routes())

   @_app.listen( port )

   return