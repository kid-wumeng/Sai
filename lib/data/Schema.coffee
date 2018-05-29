get     = require('./get')
Checker = require('./Schema.Checker')
isEmail = require('../string/isEmail')
isURL   = require('../string/isURL')



module.exports = class Schema



   constructor: ->

      @_rules   = {}
      @_formats = {}

      @format('email', isEmail)
      @format('url',   isURL)





   check: ( data, path ) =>

      ########################################
      #|
      #|   @params {object} opt
      #|   @return {Checker}
      #|
      ########################################

      if path
         data = get(data, path)

      return new Checker({
         rules:   @_rules
         formats: @_formats
         data:    data
      })





   rule: ( name, check ) =>

      ########################################
      #|
      #|   @params {string}   name
      #|   @params {function} check(data)
      #|
      #|   @return {Schema} this
      #|
      ########################################

      @_rules[name] = check

      return @





   format: ( name, check ) =>

      ########################################
      #|
      #|   @params {string}   name
      #|   @params {function} check(data)
      #|
      #|   @return {Schema} this
      #|
      ########################################

      @_formats[name] = check

      return @