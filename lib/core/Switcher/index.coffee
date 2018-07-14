module.exports = class Switcher


   constructor: ( params ) ->


      ########################################
      #|
      #|   @params {Array-like}   params
      #|   @return {sai.Switcher} switcher
      #|
      ########################################


      @_params      = params
      @_types       = []
      @_waitMatched = true
      @_caseMatched = true
      @_restMatched = true
      @_result      = undefined


      @case   = require('./@case')
      @then   = require('./@then')
      @result = require('./@result')
