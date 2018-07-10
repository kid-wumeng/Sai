module.exports = type = ( value ) ->


   ########################################
   #|
   #|   Get value's type
   #|
   #|   @params {*} value
   #|   @return {function, undefined, null, NaN } type
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


   if typeof(value) is 'object' and value.constructor is undefined
      return Object


   if isNaN(value) and value.constructor is Number
      return NaN


   return value.constructor