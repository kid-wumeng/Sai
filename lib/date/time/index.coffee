errors = require('../../errors')
error  = require('../../core/error')
isDate = require('../../is/isDate')


module.exports = ( date ) ->

   ########################################
   #|
   #|   @params {Date}   date
   #|   @return {number} timeStamp
   #|
   ########################################

   if !isDate(date)
      throw error_({ name: errors.INVALID_PARAMS, message: "`date` should be a Date" })

   return date.getTime()