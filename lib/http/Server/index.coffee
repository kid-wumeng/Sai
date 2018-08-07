Koa        = require('koa')
bodyParser = require('koa-bodyparser')
cors       = require('koa2-cors')
Router     = require('koa-router')
errors     = require('../../errors')
error      = require('../../core/error')
isObject   = require('../../is/isObject')
isBoolean  = require('../../is/isBoolean')


module.exports = class Server


   constructor: ( options = {} ) ->


      ########################################
      #|
      #|   @params {object}  options
      #|           {boolean} options.cors
      #|
      #|   @return {sai.http.Server}
      #|
      ########################################


      if !isObject(options)
         throw error({ name: errors.INVALID_PARAMS, message: "`options` should be an object" })


      @_cors = options.cors ? false


      if !isBoolean(@_cors)
         throw error({ name: errors.INVALID_PARAMS, message: "`options.cors` should be a boolean" })


      @_app    = new Koa
      @_router = new Router

      @listen = require('./@listen')

      # @all   = require('./@all')
      # @get    = require('./@get')
      # @post   = require('./@post')
      # @put    = require('./@put')
      # @patch  = require('./@patch')
      # @delete = require('./@delete')