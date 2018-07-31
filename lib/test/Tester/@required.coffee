errors = require('../../errors')
error_ = require('../../core/error')
isNil  = require('../../is/isNil')


module.exports = ( error ) ->


   ########################################
   #|
   #|   @params {*} [error]
   #|   @return {sai.Tester} @
   #|
   ########################################


   error ?= ({ data, path, name }) =>
      name: errors.INVALID_DATA
      message: "Sorry, the #{@_displayName(name)} is required."


   if isNil(@_data)
      throw error_(error, {
         data: @_data
         path: @_path
         name: @_name
      })


   return @