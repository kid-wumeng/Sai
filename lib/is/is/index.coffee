isNaN = require('../isNaN')


module.exports = ( value, type ) ->


   ########################################
   #|
   #|   @params {*}                  value
   #|   @params {function, nil, NaN} type
   #|
   #|   @return {boolean} result
   #|
   ########################################


   if type is undefined
      return value is undefined


   if type is null
      return value is null


   if type is Boolean
      if typeof(value) is 'object'
         return value instanceof Boolean
      else
         return typeof(value) is 'boolean'


   if type is Number
      if typeof(value) is 'object'
         return value instanceof Number
      else
         return typeof(value) is 'number'


   if type is String
      if typeof(value) is 'object'
         return value instanceof String
      else
         return typeof(value) is 'string'


   if type is Symbol
      return typeof(value) is 'symbol'


   if type is Function
      return typeof(value) is 'function'


   if isNaN(type)
      if isNaN(value)
         return true
      else
         return false


   if typeof(type) is 'function'

      if value is null
         return false

      if typeof(value) is 'object'
         if value.constructor is undefined  # Object.create(null)
            return true
         else
            return value instanceof type

      if typeof(value) is 'function'
         return value instanceof type


   return false