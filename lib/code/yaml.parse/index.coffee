yaml     = require('js-yaml')
errors   = require('../../errors')
error    = require('../../core/error')
isString = require('../../is/isString')


module.exports = ( text ) =>

   ########################################
   #|
   #|   @params {string} text
   #|   @return {object|boolean|number|string} data
   #|
   ########################################

   if !isString(text)
      throw error({ name: errors.INVALID_PARAMS, message: "`text` should be a string" })

   try
      return yaml.safeLoad(text)
   catch _
      throw error({ name: errors.TEXT_PARSE_FAIL, message: "`text` isn't a valid YAML" })