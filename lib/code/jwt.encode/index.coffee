jwt      = require('jsonwebtoken')
errors   = require('../../errors')
error_   = require('../../core/error')
isObject = require('../../is/isObject')
isString = require('../../is/isString')
isInt    = require('../../is/isInt')


module.exports = encode = ( data, secret, maxAge = 0 ) =>


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
      throw error_({ name: errors.INVALID_PARAMS, message: "`data` should be an object" })


   if !isString(secret)
      throw error_({ name: errors.INVALID_PARAMS, message: "`secret` should be a string" })


   if maxAge? and !isInt(maxAge)
      throw error_({ name: errors.INVALID_PARAMS, message: "`maxAge` should be an integer" })


   options =
      expiresIn: maxAge


   return jwt.sign(data, secret, options)