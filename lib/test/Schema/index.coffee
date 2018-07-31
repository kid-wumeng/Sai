module.exports = class Schema

   constructor: ->

      ########################################
      #|
      #|   @return {sai.Schema}
      #|
      ########################################

      @_rules   = {}
      @_formats = {}

      @format = require('./@format')
      @rule   = require('./@rule')
      @test   = require('./@test')