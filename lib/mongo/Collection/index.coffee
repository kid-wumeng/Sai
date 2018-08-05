errors   = require('../../errors')
error    = require('../../core/error')
is_      = require('../../is/is')
isString = require('../../is/isString')
DB       = require('../DB')


module.exports = class Collection

   constructor: ( db, name ) ->

      ########################################
      #|
      #|   @params {sai.mongo.DB} db
      #|   @params {string}       name
      #|
      #|   @return {sai.mongo.Collection}
      #|
      ########################################

      if !is_(db, DB)
         throw error({ name: errors.INVALID_PARAMS, message: "`db` should be a sai.mongo.DB" })

      if !isString(name)
         throw error({ name: errors.INVALID_PARAMS, message: "`name` should be a string" })

      @_db    = db
      @_name  = name
      @_col   = db.raw().collection(name)
      @_hides = []

      @findOne = require('./@findOne')
      @find    = require('./@find')
      @count   = require('./@count')
      @hide    = require('./@hide')

      @_formatQueries = require('./@_formatQueries')
      @_formatOptions = require('./@_formatOptions')