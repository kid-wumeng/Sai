set      = require('lodash/set')
isObject = require('../../is/isObject')
isString = require('../../is/isString')


module.exports = ( data, path, value ) ->


   ########################################
   #|
   #|   Set data's value by path.
   #|
   #|   @params {object} data
   #|   @params {string} path
   #|   @params {*}      value
   #|
   ########################################


   if isObject(data) and isString(path)
      set(data, path, value)