errors       = require('../../errors')
error_       = require('../../core/error')
len_         = require('../../core/len')
isNumber     = require('../../is/isNumber')
isString     = require('../../is/isString')
isBuffer     = require('../../is/isBuffer')
isMin        = require('../../is/isMin')
_displayName = require('./_displayName')



module.exports = ( min, error ) ->



   ########################################
   #|
   #|   @params {number} min
   #|   @params {*}     [error]
   #|
   #|   @return {sai.Tester} @
   #|
   ########################################



   if !isNumber(min)
      throw error_({ name: errors.INVALID_PARAMS, message: "`min` should be a number" })



   error ?= ({ data, path, name, min, len }) =>

      switch
         when isNumber(@_data) then desc = "#{_displayName(name)}"
         when isString(@_data) then desc = "#{_displayName(name)} length"
         when isBuffer(@_data) then desc = "#{_displayName(name)} length"
         else                       desc = "#{_displayName(name)}"

      return
         name: errors.INVALID_DATA
         message: "Sorry, the #{desc} should be ≥ #{min},
                   current is #{len}"



   if @_data? and !isMin(@_data, min)

      switch
         when isNumber(@_data) then len = @_data
         when isString(@_data) then len = len_(@_data)
         when isBuffer(@_data) then len = len_(@_data)
         else                       len = 0

      throw error_(error, {
         data: @_data
         path: @_path
         name: @_name
         min: min
         len: len
      })



   return @