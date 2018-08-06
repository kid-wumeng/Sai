errors = require('../../errors')
error  = require('../../core/error')
isDate = require('../../is/isDate')


module.exports = ( date ) ->

   ########################################
   #|
   #|   @params {Date}   date
   #|   @return {number} week ( 0 - 6 )
   #|
   ########################################

   if !isDate(date)
      throw error({ name: errors.INVALID_PARAMS, message: "`date` should be a Date" })

   return date.getDay()