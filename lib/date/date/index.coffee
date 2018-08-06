errors = require('../../errors')
error  = require('../../core/error')
isInt  = require('../../is/isInt')


module.exports = ( year, month = 1, day = 1, hour = 0, minute = 0, second = 0, milliSecond = 0 ) =>

   ########################################
   #|
   #|   @params {number} year
   #|   @params {number} [month]       = 1 (from 1 to 12)
   #|   @params {number} [day]         = 1
   #|   @params {number} [hour]        = 0
   #|   @params {number} [minute]      = 0
   #|   @params {number} [second]      = 0
   #|   @params {number} [milliSecond] = 0
   #|
   #|   @return {Date}
   #|
   ########################################

   if !isInt(year)
      throw error({ name: errors.INVALID_PARAMS, message: "`year` should be an integer" })

   if !isInt(month)
      throw error({ name: errors.INVALID_PARAMS, message: "`month` should be an integer" })

   if !isInt(day)
      throw error({ name: errors.INVALID_PARAMS, message: "`day` should be an integer" })

   if !isInt(hour)
      throw error({ name: errors.INVALID_PARAMS, message: "`hour` should be an integer" })

   if !isInt(minute)
      throw error({ name: errors.INVALID_PARAMS, message: "`minute` should be an integer" })

   if !isInt(second)
      throw error({ name: errors.INVALID_PARAMS, message: "`second` should be an integer" })

   if !isInt(milliSecond)
      throw error({ name: errors.INVALID_PARAMS, message: "`milliSecond` should be an integer" })

   return new Date( year, month - 1, day, hour, minute, second, milliSecond )