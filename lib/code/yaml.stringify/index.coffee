yaml   = require('js-yaml')
errors = require('../../errors')
error  = require('../../core/error')


module.exports = ( data ) =>

   ########################################
   #|
   #|   @params {object|boolean|number|string} data
   #|   @return {string} text
   #|
   ########################################

   try
      return yaml.safeDump(data, { indent: 4 }).trim()
   catch _
      throw error({ name: errors.INVALID_PARAMS, message: "`data` should be an object | boolean | number | string" })