padStart = require('../string/padStart')



module.exports = format = ( date, format ) =>

   ########################################
   #|
   #|   Format date to string.
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

   yyyy = date.getFullYear()
   mm   = date.getMonth() + 1
   dd   = date.getDate()
   hh   = date.getHours()
   ii   = date.getMinutes()
   ss   = date.getSeconds()

   YYYY = padStart(yyyy, 4, '0')
   MM   = padStart(mm,   2, '0')
   DD   = padStart(dd,   2, '0')
   HH   = padStart(hh,   2, '0')
   II   = padStart(ii,   2, '0')
   SS   = padStart(ss,   2, '0')


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