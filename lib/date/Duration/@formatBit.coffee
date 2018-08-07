errors   = require('../../errors')
error    = require('../../core/error')
isString = require('../../is/isString')


module.exports = ( format ) ->


   ########################################
   #|
   #|   @params {string} format
   #|   @return {string} string
   #|
   ########################################


   if !isString(format)
      throw error({ name: errors.INVALID_PARAMS, message: "`format` should be a string" })


   yyyy = "#{@yearsBit()}"
   mm   = "#{@monthsBit()}"
   dd   = "#{@daysBit()}"
   hh   = "#{@hoursBit()}"
   ii   = "#{@minutesBit()}"
   ss   = "#{@secondsBit()}"

   YYYY = yyyy.padStart(4, '0')
   MM   = mm.padStart(2, '0')
   DD   = dd.padStart(2, '0')
   HH   = hh.padStart(2, '0')
   II   = ii.padStart(2, '0')
   SS   = ss.padStart(2, '0')


   return format.replace /(YYYY|MM|DD|HH|II|SS|yyyy|mm|dd|hh|ii|ss)/g, ( placeholder ) =>
      switch placeholder
         when 'YYYY' then YYYY
         when 'MM'   then MM
         when 'DD'   then DD
         when 'HH'   then HH
         when 'II'   then II
         when 'SS'   then SS
         when 'yyyy' then yyyy
         when 'mm'   then mm
         when 'dd'   then dd
         when 'hh'   then hh
         when 'ii'   then ii
         when 'ss'   then ss