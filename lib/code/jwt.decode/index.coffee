jwt      = require('jsonwebtoken')
errors   = require('../../errors')
error_   = require('../../core/error')
isString = require('../../is/isString')


module.exports = ( token ) =>

   ########################################
   #|
   #|   @params {string} token
   #|   @return {object} data
   #|
   ########################################

   if !isString(token)
      throw error_({ name: errors.INVALID_PARAMS, message: "`token` should be a string" })

   return jwt.decode(token)