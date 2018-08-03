isNumber = require('../../is/isNumber')
errors   = require('../../errors')
error    = require('../error')


module.exports = ( ms = 0 ) ->


   ########################################
   #|
   #|   @params {number} ms
   #|
   ########################################


   if !isNumber( ms )
      throw error({ name: errors.INVALID_PARAMS, message: "`ms` should be a number" })


   await new Promise((resolve) => setTimeout(resolve, ms))