get     = require('./get')
Checker = require('./Schema.Checker')



module.exports = class Schema



   constructor: ->

      @_rules   = {}
      @_formats = {}

      @format('email', string.isEmail)
      @format('url',   string.isURL)





   check: ( data, path ) =>

      ########################################
      #|
      #|  @params {object} opt
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
      #|  @params {string}   name
      #|  @params {function} check(data)
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
      #|  @params {function} check(data)
      #|
      #|  @return {Schema} this
      #|
      ########################################

      @_formats[name] = check

      return @