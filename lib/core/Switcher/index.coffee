module.exports = class Switcher


   constructor: ( params ) ->


      ########################################
      #|
      #|   @params {Array-like}   params
      #|   @return {sai.Switcher} switcher
      #|
      ########################################


      @_params = params
      @_result = undefined


      @result = require('./@result')