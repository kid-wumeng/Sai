errors   = require('../../errors')
error    = require('../../core/error')
isObject = require('../../is/isObject')
isString = require('../../is/isString')


module.exports = class Client


   constructor: ( options = {} ) ->


      ########################################
      #|
      #|   @params {object} options
      #|           {string} options.urlBase
      #|
      #|   @return {sai.http.Client}
      #|
      ########################################


      if !isObject(options)
         throw error({ name: errors.INVALID_PARAMS, message: "`options` should be an object" })


      @_urlBase = options.urlBase ? ''


      if !isString(@_urlBase)
         throw error({ name: errors.INVALID_PARAMS, message: "`options.urlBase` should be a string" })


      @url    = require('./@url')
      @send   = require('./@send')
      @get    = require('./@get')
      @post   = require('./@post')
      @put    = require('./@put')
      @patch  = require('./@patch')
      @delete = require('./@delete')