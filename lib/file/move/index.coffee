fs       = require('fs-extra-promise')
errors   = require('../../errors')
error    = require('../../core/error')
isString = require('../../is/isString')


module.exports = ( srcPath, destPath ) ->


   ########################################
   #|
   #|   @params {string} srcPath
   #|   @params {string} destPath
   #|
   ########################################


   if !isString(srcPath)
      throw error({ name: errors.INVALID_PARAMS, message: "`srcPath` should be a string" })


   if !isString(destPath)
      throw error({ name: errors.INVALID_PARAMS, message: "`destPath` should be a string" })


   await fs.moveAsync(srcPath, destPath, { overwrite: true })