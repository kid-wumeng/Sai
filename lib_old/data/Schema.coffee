isEmail = require('validator/lib/isEmail')
isURL   = require('validator/lib/isURL')
get     = require('./get')
Checker = require('./Schema.Checker')



module.exports = class Schema



   constructor: ->

      @_rules   = {}
      @_formats = {}

      @format('email', isEmail)
      @format('url',   isURL)





   test: ( data, path ) =>

      ########################################
      #|
      #|   @params {*}      data
      #|   @params {string} path
      #|
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