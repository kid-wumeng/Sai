_is        = require('../../is/is')
isFunction = require('../../is/isFunction')



module.exports = ( types... ) ->

   ########################################
   #|
   #|   Match the params.
   #|
   #|   @params {*}            types...
   #|   @return {sai.Switcher} @
   #|
   ########################################

   @_types       = []
   @_restMatched = false

   if @_waitMatched
      if isMatchCount(@_params, types)
         if isMatchAll(@_params, types)
            @_types = types
            @_caseMatched = true

   return @



isMatchCount = ( params, types ) =>
   return params.length >= types.length



isMatchAll = ( params, types ) =>

   for type, i in types
      if isMatch( params[i], type )
         continue
      else
         return false

   return true



isMatch = ( param, type ) =>

   if isFunction(type)
      if isClass(type)
          return isBelongClass( param, type )
      else
          return isPassedCheck( param, type )

   return isEqual( param, type )



isClass       = ( type )          => /^[A-Z]/.test(type.name)
isBelongClass = ( param, Class )  => _is( param, Class )
isPassedCheck = ( param, check )  => check( param )
isEqual       = ( param, value )  => param is value