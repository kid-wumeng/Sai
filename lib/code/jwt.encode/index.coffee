jwt      = require('jsonwebtoken')
errors   = require('../../errors')
error    = require('../../core/error')
isObject = require('../../is/isObject')
isString = require('../../is/isString')
isInt    = require('../../is/isInt')


module.exports = ( data, secret, maxAge = 0 ) =>


   ########################################
   #|
   #|   @params {object} data
   #|   @params {string} secret
   #|   @params {int}    maxAge ( milliSeconds )
   #|
   #|   @return {string} token
   #|
   ########################################


   if !isObject(data)
      throw error({ name: errors.INVALID_PARAMS, message: "`data` should be an object" })


   if !isString(secret)
      throw error({ name: errors.INVALID_PARAMS, message: "`secret` should be a string" })


   if maxAge? and !isInt(maxAge)
      throw error({ name: errors.INVALID_PARAMS, message: "`maxAge` should be an integer" })


   options =
      expiresIn: maxAge


   return jwt.sign(data, secret, options)