errors   = require('../../errors')
error    = require('../../core/error')
parse    = require('../../code/yaml.parse')
readText = require('../readText')


module.exports = ( path, encoding ) ->


   ########################################
   #|
   #|   @params {string} path
   #|   @params {string} [encoding]
   #|
   #|   @return {object|boolean|number|string} data
   #|
   ########################################

   text = await readText( path, encoding )

   try
      return parse(text)
   catch errorRaw
      throw error({ name: errors.TEXT_PARSE_FAIL, message: "`#{path}` isn't a valid YAML" })