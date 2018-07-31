errors       = require('../../errors')
error_       = require('../../core/error')
isBuffer     = require('../../is/isBuffer')
_displayData = require('./_displayData')
_displayName = require('./_displayName')


module.exports = ( error ) ->


   ########################################
   #|
   #|   @params {*} [error]
   #|   @return {sai.Tester} @
   #|
   ########################################


   error ?= ({ data, path, name }) =>
      name: errors.INVALID_DATA
      message: "Sorry, the #{_displayName(name)} should be a Buffer,
                current is #{_displayData(data)}"


   if @_data? and !isBuffer(@_data)
      throw error_(error, {
         data: @_data
         path: @_path
         name: @_name
      })


   return @