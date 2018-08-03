fileType = require('file-type')
errors   = require('../../errors')
error    = require('../../core/error')
isBuffer = require('../../is/isBuffer')


module.exports = ( file ) ->


   ########################################
   #|
   #|   @params {buffer} file
   #|   @return {string} mime
   #|
   ########################################


   if !isBuffer( file )
       throw error({
          name: errors.INVALID_PARAMS
          message: "`file` should be a buffer"
       })


   return fileType(file)?.mime ? ''