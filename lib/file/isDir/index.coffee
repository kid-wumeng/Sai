path_ = require('path')
fs    = require('fs')


module.exports = ( path ) ->

   ########################################
   #|
   #|   @params {string}  path
   #|   @return {boolean} result
   #|
   ########################################

   path = path_.normalize( path )

   return new Promise (resolve, reject) =>
      fs.stat path, (error, stats) =>
         if error
            resolve(false)
         else
            resolve(stats.isDirectory())