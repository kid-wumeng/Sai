errors       = require('../../errors')
error_       = require('../../core/error')
is_          = require('../../is/is')
_displayData = require('./_displayData')
_displayName = require('./_displayName')


module.exports = ( type, error ) ->


   ########################################
   #|
   #|   @params {*} type
   #|   @params {*} [error]
   #|
   #|   @return {sai.Tester} @
   #|
   ########################################


   error ?= ({ data, path, name }) =>
      name: errors.INVALID_DATA
      message: "Sorry, the #{_displayName(name)} should be a #{type?.name ? type},
                current is #{_displayData(data)}"


   if @_data? and !is_(@_data, type)
      throw error_(error, {
         data: @_data
         path: @_path
         name: @_name
         type: type
      })


   return @