isFunction = require('../../is/isFunction')


module.exports = ( valueOrCallback ) ->

   ########################################
   #|
   #|   Run callback and set result.
   #|
   #|   @return {*} valueOrCallback
   #|
   ########################################

   if !@_over
      if @_matched
         @_over = true

         if isFunction(valueOrCallback)
            @_result = valueOrCallback.call(@_context, @_params)
         else
            @_result = valueOrCallback

   return @