isNaN = require('lodash/isNaN')


module.exports = ( value ) ->


   ########################################
   #|
   #|   Get value's type.
   #|
   #|   @params {*} value
   #|   @return {function, undefined, null, NaN} type
   #|
   ########################################


   if value is undefined
      return undefined


   if value is null
      return null


   if typeof(value) is 'symbol'
      return Symbol


   if typeof(value) is 'function'
      return Function


   if isNaN(value)
      return NaN


   if typeof(value) is 'object' and value.constructor is undefined  # Object.create(null)
      return Object


   return value.constructor