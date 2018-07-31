isBoolean     = require('../../is/isBoolean')
isString      = require('../../is/isString')
isArray       = require('../../is/isArray')
isPlainObject = require('../../is/isPlainObject')
isObject      = require('../../is/isObject')


module.exports = ( data ) ->

   ########################################
   #|
   #|   @params {*}      data
   #|   @return {string} data
   #|
   ########################################

   switch
      when isBoolean(data)     then "{ " + data + " }"
      when isString(data)      then "'" + data + "'"
      when isArray(data)       then "[ " + data.join(', ') + " ]"
      when isPlainObject(data) then data
      when isObject(data)      then "< " + data.constructor.name + " >"
      else                          data