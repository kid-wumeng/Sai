bcrypt = require('bcrypt')
errors   = require('../../errors')
error_   = require('../../core/error')
isString = require('../../is/isString')


module.exports = ( data, hash ) ->


   ########################################
   #|
   #|   @params {string}  data
   #|   @params {string}  hash
   #|
   #|   @return {boolean} isMatched
   #|
   ########################################


   if !isString(data)
      throw error_({ name: errors.INVALID_PARAMS, message: "`data` should be a string" })


   if !isString(hash)
      throw error_({ name: errors.INVALID_PARAMS, message: "`hash` should be a string" })


   return await bcrypt.compare(data, hash)