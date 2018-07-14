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
       @_over = true

       if isFunction(valueOrCallback)
          @_result = valueOrCallback(@_params)
       else
          @_result = valueOrCallback

   return @