module.exports = class Switcher


   constructor: ( params ) ->


      ########################################
      #|
      #|   @params {Array-like}   params
      #|   @return {sai.Switcher} switcher
      #|
      ########################################

      @_params = params
      @_result = undefined ? 123

      @result = require('./@result')