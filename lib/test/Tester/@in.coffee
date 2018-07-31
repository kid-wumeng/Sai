errors       = require('../../errors')
error_       = require('../../core/error')
_displayData = require('./_displayData')
_displayName = require('./_displayName')
_displayType = require('./_displayType')


module.exports = ( enums, error ) ->


   ########################################
   #|
   #|   @params {Array} enums
   #|   @params {*}    [error]
   #|
   #|   @return {sai.Tester} @
   #|
   ########################################


   error ?= ({ data, path, name, enums }) =>
      name: errors.INVALID_DATA
      message: "Sorry, the #{_displayName(name)} should be in [#{enums.map(_displayData).join(', ')}],
                current is #{_displayData(data)}"


   if @_data? and !enums.includes(@_data)
      throw error_(error, {
         data: @_data
         path: @_path
         name: @_name
         enums: enums
      })


   return @