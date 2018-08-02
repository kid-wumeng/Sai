path_    = require('path')
fs       = require('fs-extra-promise')
errors   = require('../../errors')
error    = require('../../core/error')
isString = require('../../is/isString')



module.exports = ( path, encoding = 'utf8' ) ->


   ########################################
   #|
   #|   @params {string} path
   #|   @return {string} text
   #|
   ########################################


   if !isString( path )
      throw error({ name: errors.INVALID_PARAMS, message: "`path` should be a string." })


   if encoding and !isString( encoding )
      throw error({ name: errors.INVALID_PARAMS, message: "`encoding` should be a string." })


   path = path_.normalize( path )


   try
      return await fs.readFileAsync( path, encoding )
   catch errorRaw
      throw error({ name: errors.FILE_NOT_FOUND, message: "`#{path}` not found or isn't a file." })