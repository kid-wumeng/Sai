isFunction = require('../../is/isFunction')



module.exports = ( valueOrCallback ) ->

   ########################################
   #|
   #|   Run callback and set result.
   #|
   #|   @return {*} valueOrCallback
   #|
   ########################################

   if @_caseMatched and @_restMatched
      @_waitMatched = false

      if isFunction(valueOrCallback)
         @_result = valueOrCallback(@_params)
      else
         @_result = valueOrCallback

   else
      @_types       = []
      @_caseMatched = true
      @_restMatched = true


   return @