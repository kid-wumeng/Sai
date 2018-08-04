bcrypt = require('bcrypt')
errors = require('../../errors')
error_ = require('../../core/error')
isN    = require('../../is/isN')


module.exports = ( rounds = 10 ) ->

   ########################################
   #|
   #|   @params {int}    rounds ( 0 - 31 )
   #|   @return {string} salt
   #|
   ########################################

   if !isN(rounds)
      throw error_({ name: errors.INVALID_PARAMS, message: "`rounds` should be a natural-number" })

   return await bcrypt.genSalt(rounds)