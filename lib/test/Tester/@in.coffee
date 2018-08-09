errors       = require('../../errors')
error_       = require('../../core/error')
contain      = require('../../core/contain')
isArrayLike  = require('../../is/isArrayLike')
_displayData = require('./_displayData')
_displayName = require('./_displayName')


module.exports = ( enums, error ) ->


   ########################################
   #|
   #|   @params {Array-like} enums
   #|   @params {*}         [error]
   #|
   #|   @return {sai.Tester} @
   #|
   ########################################


   if !isArrayLike(enums)
      throw error_({ name: errors.INVALID_PARAMS, message: "`enums` should be an Array-like" })


   error ?= ({ data, path, name, enums }) =>
      name: errors.INVALID_DATA
      message: "Sorry, the #{_displayName(name)} should be in [#{[].map.call(enums, _displayData).join(', ')}],
                current is #{_displayData(data)}"


   if @_data? and !contain(enums, @_data)
      throw error_(error, {
         data: @_data
         path: @_path
         name: @_name
         enums: enums
      })


   return @