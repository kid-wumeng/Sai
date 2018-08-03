fs       = require('fs-extra-promise')
errors   = require('../../errors')
error    = require('../../core/error')
isString = require('../../is/isString')
isBuffer = require('../../is/isBuffer')



module.exports = ( path, file ) ->


   ########################################
   #|
   #|   @params {string} path
   #|   @params {buffer} file
   #|
   ########################################


   if !isString( path )
      throw error({ name: errors.INVALID_PARAMS, message: "`path` should be a string" })

   if !isBuffer( file )
      throw error({ name: errors.INVALID_PARAMS, message: "`file` should be a buffer" })


   await fs.ensureFileAsync( path )
   await fs.writeFileAsync( path, file )