bcrypt   = require('bcrypt')
errors   = require('../../errors')
error_   = require('../../core/error')
isString = require('../../is/isString')
genSalt  = require('../bcrypt.salt')


module.exports = ( data, salt = '' ) ->


   ########################################
   #|
   #|   @params {string} data
   #|   @params {string} [salt]
   #|
   #|   @return {string} hash
   #|
   ########################################


   if !isString(data)
      throw error_({ name: errors.INVALID_PARAMS, message: "`data` should be a string" })


   if salt? and !isString(salt)
      throw error_({ name: errors.INVALID_PARAMS, message: "`salt` should be a string" })


   if !salt
       salt = await genSalt(10)


   return await bcrypt.hash(data, salt)