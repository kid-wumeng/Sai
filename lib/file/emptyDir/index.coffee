fs       = require('fs-extra-promise')
errors   = require('../../errors')
error    = require('../../core/error')
isString = require('../../is/isString')
isDir    = require('../isDir')
isFile   = require('../isFile')


module.exports = ( path ) ->


   ########################################
   #|
   #|   @params {string} path
   #|
   ########################################


   if !isString( path )
      throw error({ name: errors.INVALID_PARAMS, message: "`path` should be a string" })


   if await isFile( path )
      throw error({ name: errors.DIR_NOT_FOUND, message: "`#{path}` is already a file" })


   if await isDir( path )
      await fs.emptyDirAsync( path )