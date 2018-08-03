errors    = require('../../errors')
error     = require('../../core/error')
isObject  = require('../../is/isObject')
writeText = require('../writeText')


module.exports = ( path, data, encoding ) ->


   ########################################
   #|
   #|   @params {string} path
   #|   @params {object} data
   #|   @params {string} [encoding]
   #|
   ########################################


   if !isObject(data)
      throw error({ name: errors.INVALID_PARAMS, message: "`data` should be a object" })


   text = JSON.stringify(data, null, 4)


   await writeText( path, text, encoding )