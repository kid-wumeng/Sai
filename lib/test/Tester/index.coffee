get = require('../../core/get')


module.exports = class Tester

   constructor: ( data, path = '' ) ->

      ########################################
      #|
      #|   @params {*}      data
      #|   @params {string} [path]
      #|
      #|   @return {sai.Tester} @
      #|
      ########################################

      @_data = if path then get(data, path) else data
      @_path = path
      @_name = ''

      @_displayData = require('./@_displayData')
      @_displayName = require('./@_displayName')

      @name     = require('./@name')
      @schema   = require('./@schema')
      @required = require('./@required')