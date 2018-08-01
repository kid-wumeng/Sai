isSpace = require('../../is/isSpace')
isEmail = require('../../is/isEmail')
isURL   = require('../../is/isURL')


module.exports = class Schema

   constructor: ->

      ########################################
      #|
      #|   @return {sai.Schema}
      #|
      ########################################

      @_formats = {}
      @_rules   = {}

      @format = require('./@format')
      @rule   = require('./@rule')
      @test   = require('./@test')

      @format('space', isSpace)
      @format('email', isEmail)
      @format('url',   isURL)