isNaN = require('../isNaN')


module.exports = ( value, Class ) ->


   ########################################
   #|
   #|   @params {*}                  value
   #|   @params {function, nil, NaN} Class
   #|
   #|   @return {boolean} result
   #|
   ########################################


   if Class is undefined
      return value is undefined


   if Class is null
      return value is null


   if Class is Boolean
      if typeof(value) is 'object'
         return value instanceof Boolean
      else
         return typeof(value) is 'boolean'


   if Class is Number
      if typeof(value) is 'object'
         return value instanceof Number
      else
         return typeof(value) is 'number'


   if Class is String
      if typeof(value) is 'object'
         return value instanceof String
      else
         return typeof(value) is 'string'


   if Class is Symbol
      return typeof(value) is 'symbol'


   if Class is Function
      return typeof(value) is 'function'


   if isNaN(Class)
      if isNaN(value)
         return true
      else
         return false


   if typeof(Class) is 'function'

      if value is null
         return false

      if typeof(value) is 'object'
         if value.constructor is undefined  # Object.create(null)
            return true
         else
            return value instanceof Class

      if typeof(value) is 'function'
         return value instanceof Class


   return false