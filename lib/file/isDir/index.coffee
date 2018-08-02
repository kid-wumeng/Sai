path_    = require('path')
fs       = require('fs')
errors   = require('../../errors')
error    = require('../../core/error')
isString = require('../../is/isString')



module.exports = ( path ) ->


   ########################################
   #|
   #|   @params {string}  path
   #|   @return {boolean} result
   #|
   ########################################


   if !isString( path )
      throw error({ name: errors.INVALID_PARAMS, message: "`path` should be a string." })


   path = path_.normalize( path )


   return new Promise (resolve, reject) =>
      fs.stat path, (error, stats) =>
         if error
            resolve(false)
         else
            resolve(stats.isDirectory())