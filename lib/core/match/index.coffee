isString = require('../../is/isString')
isRegExp = require('../../is/isRegExp')


module.exports = ( string, pattern, flags = '' ) ->

   ########################################
   #|
   #|   @params {string}         string
   #|   @params {string, RegExp} pattern
   #|   @params {string}         [flags]
   #|
   #|   @return {boolean}        result
   #|
   ########################################

   if isString(pattern)
      if isString(flags) and isString(flags)
         pattern = new RegExp(pattern, flags)
      else
         pattern = new RegExp(pattern)

   if isString(string) and isRegExp(pattern)
      return pattern.test(string)
   else
      return false