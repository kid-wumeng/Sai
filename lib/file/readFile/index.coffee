fs       = require('fs-extra-promise')
errors   = require('../../errors')
error    = require('../../core/error')
isString = require('../../is/isString')



module.exports = ( path ) ->


   ########################################
   #|
   #|   @params {string} path
   #|   @return {buffer} file
   #|
   ########################################


   if !isString( path )
      throw error({ name: errors.INVALID_PARAMS, message: "`path` should be a string." })


   try
      return await fs.readFileAsync( path )
   catch errorRaw
      throw error({ name: errors.FILE_NOT_FOUND, message: "`#{path}` not found or isn't a file." })