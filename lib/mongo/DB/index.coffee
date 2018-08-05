errors    = require('../../errors')
error     = require('../../core/error')
isObject  = require('../../is/isObject')
isString  = require('../../is/isString')
isN       = require('../../is/isN')
isBoolean = require('../../is/isBoolean')


module.exports = class DB


   constructor: ( options = {} )->


      ########################################
      #|
      #|   @params {object} options
      #|                    {string}  host
      #|                    {number}  port
      #|                    {string}  name
      #|                    {string}  user
      #|                    {string}  pass
      #|                    {boolean} autoID
      #|                    {string}  autoIDStore
      #|
      #|   @return {sai.mongo.DB}
      #|
      ########################################


      if !isObject(options)
         throw error({ name: errors.INVALID_PARAMS, message: "`options` should be an object" })


      @_host        = options.host        ? '0.0.0.0'
      @_port        = options.port        ?  27017
      @_name        = options.name        ? 'test'
      @_user        = options.user        ? ''
      @_pass        = options.pass        ? ''
      @_autoID      = options.autoID      ? false
      @_autoIDStore = options.autoIDStore ? 'id_store'


      if !isString(@_host)
         throw error({ name: errors.INVALID_PARAMS, message: "`options.host` should be a string" })

      if !isN(@_port)
         throw error({ name: errors.INVALID_PARAMS, message: "`options.port` should be a natural-number" })

      if !isString(@_name)
         throw error({ name: errors.INVALID_PARAMS, message: "`options.name` should be a string" })

      if !isString(@_user)
         throw error({ name: errors.INVALID_PARAMS, message: "`options.user` should be a string" })

      if !isString(@_pass)
         throw error({ name: errors.INVALID_PARAMS, message: "`options.pass` should be a string" })

      if !isBoolean(@_autoID)
         throw error({ name: errors.INVALID_PARAMS, message: "`options.autoID` should be a boolean" })

      if !isString(@_autoIDStore)
         throw error({ name: errors.INVALID_PARAMS, message: "`options.autoIDStore` should be a string" })

      if !@_autoIDStore
         throw error({ name: errors.INVALID_PARAMS, message: "`options.autoIDStore` should be non-empty string" })


      @_client = null
      @_db     = null


      @uri     = require('./@uri')
      @connect = require('./@connect')
      @col     = require('./@col')
      @raw     = require('./@raw')


      @_ensureAutoIDStore = require('./@_ensureAutoIDStore')