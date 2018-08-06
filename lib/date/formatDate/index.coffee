errors   = require('../../errors')
error    = require('../../core/error')
isDate   = require('../../is/isDate')
isString = require('../../is/isString')


module.exports = ( date, format ) ->


   ########################################
   #|
   #|   Format date to string
   #|
   #|   eq:
   #|      date = time.date(2016, 3, 8, 6, 12, 45)
   #|      time.format(date, 'YYYY-MM-DD HH:II:SS') => '2016-03-08 06:12:45'
   #|
   #|   @params {Date}   date
   #|   @params {string} format
   #|
   #|   @return {string} string
   #|
   ########################################


   if !isDate(date)
      throw error({ name: errors.INVALID_PARAMS, message: "`date` should be a Date" })

   if !isString(format)
      throw error({ name: errors.INVALID_PARAMS, message: "`format` should be a string" })


   yyyy = "#{date.getFullYear()}"
   mm   = "#{date.getMonth() + 1}"
   dd   = "#{date.getDate()}"
   hh   = "#{date.getHours()}"
   ii   = "#{date.getMinutes()}"
   ss   = "#{date.getSeconds()}"

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