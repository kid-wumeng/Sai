hasIn    = require('lodash/hasIn')
isObject = require('../../is/isObject')
isString = require('../../is/isString')


module.exports = ( data, path ) ->


   ########################################
   #|
   #|   Is has value by path in data ?
   #|
   #|   @params {object}  data
   #|   @params {string}  path
   #|
   #|   @return {boolean} result
   #|
   ########################################


   if isObject(data) and isString(path)
      return hasIn(data, path)
   else
      return false