errors    = require('../../errors')
error     = require('../../core/error')
stringify = require('../../code/yaml.stringify')
writeText = require('../writeText')


module.exports = ( path, data, encoding ) ->


   ########################################
   #|
   #|   @params {string}                       path
   #|   @params {object|boolean|number|string} data
   #|   @params {string}                       [encoding]
   #|
   ########################################

   try
      text = stringify(data)
   catch _
      throw error({ name: errors.INVALID_PARAMS, message: "`data` should be an object | boolean | number | string" })

   await writeText( path, text, encoding )