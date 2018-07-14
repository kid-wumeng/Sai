module.exports = class Switcher

   constructor: ( params ) ->

      ########################################
      #|
      #|   @params {Array-like}   params
      #|   @return {sai.Switcher} switcher
      #|
      ########################################

      @_params  = params
      @_matched = false       # if true, means current @case is matched
      @_over    = false       # if true, ignore others @case, @then, @default
      @_result  = undefined   # record the @then's value by matched @case ( if not matched, is @default's value )

      @case    = require('./@case')
      @then    = require('./@then')
      @default = require('./@default')
      @result  = require('./@result')