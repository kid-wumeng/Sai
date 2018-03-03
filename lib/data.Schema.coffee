_       = require('lodash')
Checker = require('./data.Schema.Checker')



module.exports = class Schema



   constructor: ->

      @_rules   = {}
      @_formats = {}





   check: ( data, path ) =>

      ########################################
      #|
      #|  @params {object} opt
      #|
      ########################################

      if path
         data = _.get(data, path)

      return new Checker({
         rules:   @_rules
         formats: @_formats
         data:    data
      })





   rule: ( name, check ) =>

      ########################################
      #|
      #|  @params {string}   name
      #|  @params {function} check
      #|
      #|  @return {Schema} this
      #|
      ########################################

      @_rules[name] = check

      return @



   format: ( name, check ) =>

      ########################################
      #|
      #|  @params {string}   name
      #|  @params {function} check
      #|
      #|  @return {Schema} this
      #|
      ########################################

      @_formats[name] = check

      return @