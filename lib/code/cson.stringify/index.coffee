cson   = require('cson')
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
      return cson.stringify(data, null, 4)
   catch _
      throw error({ name: errors.INVALID_PARAMS, message: "`data` should be an object | boolean | number | string" })