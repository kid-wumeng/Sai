Koa        = require('koa')
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
      #|           {boolean} options.paramCastBoolean
      #|           {boolean} options.paramCastNumber
      #|           {boolean} options.queryCastBoolean
      #|           {boolean} options.queryCastNumber
      #|
      #|   @return {sai.http.Server}
      #|
      ########################################


      if !isObject(options)
         throw error({ name: errors.INVALID_PARAMS, message: "`options` should be an object" })


      @_cors             = options.cors             ? false
      @_paramCastBoolean = options.paramCastBoolean ? false
      @_paramCastNumber  = options.paramCastNumber  ? false
      @_queryCastBoolean = options.queryCastBoolean ? false
      @_queryCastNumber  = options.queryCastNumber  ? false


      if !isBoolean(@_cors)
         throw error({ name: errors.INVALID_PARAMS, message: "`options.cors` should be a boolean" })

      if !isBoolean(@_paramCastBoolean)
         throw error({ name: errors.INVALID_PARAMS, message: "`options.paramCastBoolean` should be a boolean" })

      if !isBoolean(@_paramCastNumber)
         throw error({ name: errors.INVALID_PARAMS, message: "`options.paramCastNumber` should be a boolean" })

      if !isBoolean(@_queryCastBoolean)
         throw error({ name: errors.INVALID_PARAMS, message: "`options.queryCastBoolean` should be a boolean" })

      if !isBoolean(@_queryCastNumber)
         throw error({ name: errors.INVALID_PARAMS, message: "`options.queryCastNumber` should be a boolean" })


      @_app    = new Koa
      @_router = new Router


      @all    = require('./@all')
      @listen = require('./@listen')

      # @get    = require('./@get')
      # @post   = require('./@post')
      # @put    = require('./@put')
      # @patch  = require('./@patch')
      # @delete = require('./@delete')

      @_addRoute = require('./@_addRoute')