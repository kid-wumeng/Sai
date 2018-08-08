bodyParser = require('koa-bodyparser')
cors       = require('koa2-cors')
errors     = require('../../errors')
error      = require('../../core/error')
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

   @_app.use(cors())
   @_app.use(bodyParser())
   @_app.use(@_router.routes())

   @_app.listen( port )

   return