ms       = require('ms')
errors   = require('../../errors')
error    = require('../../core/error')
isNumber = require('../../is/isNumber')
isString = require('../../is/isString')


module.exports = ( time ) ->

   ########################################
   #|
   #|   @params {Date}   date
   #|   @return {number} ms ( 0 - 999 )
   #|
   ########################################

   switch
      when isNumber(time) then ms(time, { long: true })
      when isString(time) then ms(time)
      else throw error({ name: errors.INVALID_PARAMS, message: "`time` should be a number or string" })