errors       = require('../../errors')
error_       = require('../../core/error')
isArrayLike  = require('../../is/isArrayLike')
isString     = require('../../is/isString')
isBuffer     = require('../../is/isBuffer')
isMIME       = require('../../is/isMIME')
mime_        = require('../../file/mime')
_displayData = require('./_displayData')
_displayName = require('./_displayName')


module.exports = ( mimes, error ) ->


   ########################################
   #|
   #|   @params {Array-like} mimes
   #|   @params {*}         [error]
   #|
   #|   @return {sai.Tester} @
   #|
   ########################################


   if isString(mimes)
      mimes = [mimes]


   if !isArrayLike(mimes)
      throw error_({ name: errors.INVALID_PARAMS, message: "`mimes` should be an Array-like or a string" })


   error ?= ({ data, path, name, mimes, mime }) =>
      name: errors.INVALID_DATA
      message: "Sorry, the #{_displayName(name)} MIME should be in [#{[].map.call(mimes, _displayData).join(', ')}],
                current is #{_displayData(mime)}"


   if @_data? and !isMIME(@_data, mimes)
      throw error_(error, {
         data:  @_data
         path:  @_path
         name:  @_name
         mimes: mimes
         mime:  if isBuffer(@_data) then mime_(@_data) else ''
      })


   return @