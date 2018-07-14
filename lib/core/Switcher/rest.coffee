module.exports = ->

   ########################################
   #|
   #|   Match the rest params.
   #|
   #|   @return {sai.Switcher} @
   #|
   ########################################

   @_restMatched = false

   if @_waitMatched
      if @_caseMatched
         if isMatchCount(@_params, @_types)
            @_restMatched = true

   return @



isMatchCount = ( params, types ) =>
   return params.length > types.length