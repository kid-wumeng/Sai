get      = require('lodash/get')
isObject = require('../../is/isObject')
isString = require('../../is/isString')


module.exports = ( data, path, defaultValue = undefined ) ->


   ########################################
   #|
   #|   Get data's value by path
   #|
   #|   @params {object} data
   #|   @params {string} path
   #|   @params {*}      [defaultValue]
   #|
   #|   @return {*} value
   #|
   ########################################


   if isObject(data) and isString(path)
      return get(data, path, defaultValue)
   else
      return defaultValue