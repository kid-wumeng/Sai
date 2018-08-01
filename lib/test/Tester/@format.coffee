errors       = require('../../errors')
error_       = require('../../core/error')
is_          = require('../../is/is')
isString     = require('../../is/isString')
isFunction   = require('../../is/isFunction')
Schema       = require('../Schema')
_displayData = require('./_displayData')
_displayName = require('./_displayName')


module.exports = ( format, error ) ->


   ########################################
   #|
   #|   @params {number} min
   #|   @params {*}     [error]
   #|
   #|   @return {sai.Tester} @
   #|
   ########################################


   if !isString(format)
      throw error_({ name: errors.INVALID_PARAMS, message: "`format` should be a string." })

   if !is_(@_schema, Schema)
      throw error_({ name: errors.INVALID_PARAMS, message: "the tester has not a schema." })

   if !isFunction(check = @_schema.format(format))
      throw error_({ name: errors.INVALID_PARAMS, message: "the format '#{format}' is not found." })


   error ?= ({ data, path, name, format }) =>
      name: errors.INVALID_DATA
      message: "Sorry, the #{_displayName(name)} should be a '#{format}',
                current is #{_displayData(data)}"


   if !check(@_data)
      throw error_(error, {
         data:   @_data
         path:   @_path
         name:   @_name
         format: format
      })


   return @