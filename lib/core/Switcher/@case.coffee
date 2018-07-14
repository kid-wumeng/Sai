_is        = require('../../is/is')
isFunction = require('../../is/isFunction')
isEqual    = require('../../is/isEqual')




module.exports = ( types... ) ->

   ########################################
   #|
   #|   Match the params.
   #|
   #|   @params {*}            types...
   #|   @return {sai.Switcher} @
   #|
   ########################################

   if !@_over
      if isMatchCount(@_params, types) and isMatchAll(@_params, types)
         @_matched = true
      else
         @_matched = false

   return @




isMatchCount = ( params, types ) =>
   return params.length is types.length




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