unset    = require('lodash/unset')
isObject = require('../../is/isObject')
isString = require('../../is/isString')


module.exports = ( data, path ) ->


   ########################################
   #|
   #|   Delete data's value by path.
   #|
   #|   @params {object} data
   #|   @params {string} path
   #|
   ########################################


   if isObject(data) and isString(path)
      unset(data, path)