isString = require('../isString')
isRegExp = require('../isRegExp')


module.exports = ( value, pattern, attributes ) ->

   ########################################
   #|
   #|   @params {*}              value
   #|   @params {string, RegExp} pattern
   #|   @params {string}         [attributes]
   #|
   #|   @return {boolean}        result
   #|
   ########################################

   if isString(pattern)
      if isString(attributes) and /^[igm]*$/.test(attributes)
         pattern = new RegExp(pattern, attributes)
      else
         pattern = new RegExp(pattern)

   if isString(value) and isRegExp(pattern)
      return pattern.test(value)
   else
      return false