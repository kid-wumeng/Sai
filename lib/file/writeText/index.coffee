fs       = require('fs-extra-promise')
errors   = require('../../errors')
error    = require('../../core/error')
isString = require('../../is/isString')


module.exports = ( path, text = '', encoding = 'utf8' ) ->


   ########################################
   #|
   #|   @params {string} path
   #|   @params {string} text
   #|   @params {string} [encoding]
   #|
   ########################################


   if !isString( path )
      throw error({ name: errors.INVALID_PARAMS, message: "`path` should be a string" })

   if !isString( text )
      throw error({ name: errors.INVALID_PARAMS, message: "`text` should be a string" })

   if encoding? and !isString( encoding )
      throw error({ name: errors.INVALID_PARAMS, message: "`encoding` should be a string" })


   await fs.ensureFileAsync( path )
   await fs.writeFileAsync( path, text, encoding )