jwt      = require('jsonwebtoken')
errors   = require('../../errors')
error    = require('../../core/error')
isString = require('../../is/isString')


module.exports = ( token, secret ) =>


   ########################################
   #|
   #|   @params {string} token
   #|   @params {string} secret
   #|
   #|   @return {boolean} isValid
   #|
   ########################################


   if !isString(token)
      throw error({ name: errors.INVALID_PARAMS, message: "`token` should be a string" })


   if !isString(secret)
      throw error({ name: errors.INVALID_PARAMS, message: "`secret` should be a string" })


   try
      jwt.verify(token, secret)
      return true
   catch error
      return false