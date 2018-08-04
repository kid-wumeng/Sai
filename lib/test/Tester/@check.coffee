errors       = require('../../errors')
error_       = require('../../core/error')
isFunction   = require('../../is/isFunction')
_displayData = require('./_displayData')
_displayName = require('./_displayName')


module.exports = ( check, error ) ->


   ########################################
   #|
   #|   @params {function} check
   #|   @params {*}       [error]
   #|
   #|   @return {sai.Tester} @
   #|
   ########################################


   if !isFunction(check)
      throw error_({ name: errors.INVALID_PARAMS, message: "`check` should be a function" })


   error ?= ({ data, path, name, check }) =>
      name: errors.INVALID_DATA
      message: "Sorry, the #{_displayName()} check failed,
                current is #{_displayData(data)}"


   if @_data? and !check(@_data)
      throw error_(error, {
         data: @_data
         path: @_path
         name: @_name
         check: check
      })


   return @