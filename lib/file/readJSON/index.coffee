errors   = require('../../errors')
error    = require('../../core/error')
readText = require('../readText')



module.exports = ( path, encoding = 'utf8' ) ->


   ########################################
   #|
   #|   @params {string} path
   #|   @return {object} json
   #|
   ########################################


   text = await readText( path, encoding )


   try
      return JSON.parse(text)
   catch errorRaw
      throw error({ name: errors.TEXT_PARSE_FAIL, message: "`#{path}` isn't a valid JSON." })