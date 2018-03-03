string = require('./string')



########################################
#|
#|  @params {Date}
#|  @return {number}
#|     month: 1-12
#|     week:  0-6
#|
########################################

exports.year   = ( date ) => date.getFullYear()
exports.month  = ( date ) => date.getMonth() + 1
exports.day    = ( date ) => date.getDate()
exports.hour   = ( date ) => date.getHours()
exports.minute = ( date ) => date.getMinutes()
exports.second = ( date ) => date.getSeconds()
exports.ms     = ( date ) => date.getMilliseconds()
exports.week   = ( date ) => date.getDay()
exports.stamp  = ( date ) => date.getTime()





exports.date = ( year, month = 1, day = 1, hour = 0, minute = 0, second = 0, ms = 0 ) =>

   ########################################
   #|
   #|  @params {number} year
   #|  @params {number} [month]  = 1 (from 1 to 12)
   #|  @params {number} [day]    = 1
   #|  @params {number} [hour]   = 0
   #|  @params {number} [minute] = 0
   #|  @params {number} [second] = 0
   #|  @params {number} [ms]     = 0
   #|
   #|  @return {Date}
   #|
   ########################################

   return new Date( year, month - 1, day, hour, minute, second, ms )





exports.format = ( date, format ) =>

   ########################################
   #|
   #|  Format date to string.
   #|
   #|  eq:
   #|     date = time.date(2016, 3, 8, 6, 12, 45)
   #|     time.format(date, 'YYYY-MM-DD HH:II:SS') => '2016-03-08 06:12:45'
   #|
   #|  @params {string} format
   #|  @params {string} string
   #|
   ########################################

   yyyy = @year( date )
   mm   = @month( date )
   dd   = @day( date )
   hh   = @hour( date )
   ii   = @minute( date )
   ss   = @second( date )

   YYYY = string.padStart(yyyy, 4, '0')
   MM   = string.padStart(mm,   2, '0')
   DD   = string.padStart(dd,   2, '0')
   HH   = string.padStart(hh,   2, '0')
   II   = string.padStart(ii,   2, '0')
   SS   = string.padStart(ss,   2, '0')

   return format.replace /(YYYY|MM|DD|HH|II|SS|yyyy|mm|dd|hh|ii|ss)/g, (placeholder) =>
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





exports.between = ( start, end ) =>

   ########################################
   #|
   #|  Count the duration between start to end.
   #|
   #|  eq:
   #|     start = time.date(2018, 3, 12, 6, 30, 45)
   #|     end   = time.date(2018, 3, 12, 8, 20, 25)
   #|
   #|     time.between(start, end)
   #|        => { days: 0, hours: 1, minutes: 109, seconds: 6580, mss: 6580000 }
   #|
   #|
   #|  Notice, return 0 for all attributes when start >= end.
   #|
   #|  eq:
   #|     start = time.date(2018, 3, 12, 8, 20, 25)
   #|     end   = time.date(2018, 3, 12, 6, 30, 45)
   #|
   #|     time.between(start, end)
   #|        => { days: 0, hours: 0, minutes: 0, seconds: 0, mss: 0 }
   #|
   #|
   #|  @params {Date} start
   #|  @params {Date} end
   #|
   #|  @return {object} duration
   #|          {number} duration.days
   #|          {number} duration.hours
   #|          {number} duration.minutes
   #|          {number} duration.seconds
   #|          {number} duration.mss
   #|
   ########################################

   start = start.getTime()
   end   = end.getTime()

   if start >= end
      return { days: 0, hours: 0, minutes: 0, seconds: 0, mss: 0 }

   mss     = end - start
   seconds = parseInt( mss     / 1000 )
   minutes = parseInt( seconds / 60 )
   hours   = parseInt( minutes / 60 )
   days    = parseInt( hours   / 24 )

   return { days, hours, minutes, seconds, mss }





exports.from = ( start ) =>

   ########################################
   #|
   #|  Count the duration from start.
   #|
   #|  @params {Date}   start
   #|  @return {object} duration - the attributes same as time.between()
   #|
   ########################################

   return @between( start, new Date() )





exports.to = ( end ) =>

   ########################################
   #|
   #|  Count the duration to end.
   #|
   #|  @params {Date}   end
   #|  @return {object} duration - the attributes same as time.between()
   #|
   ########################################

   return @between( new Date(), end )





# exports.displayDate = (date) ->
#
#    duration = time.from(date)
#
#    switch
#       when duration.mss     <= 0  then "刚刚"
#       when duration.seconds <= 60 then "#{duration.seconds}秒前"
#       when duration.minutes <= 60 then "#{duration.minutes}分钟前"
#       when duration.hours   <= 24 then "#{duration.hours}小时前"
#       when duration.days    <= 5  then "#{duration.days}天前"
#
#       else time.format(date, 'YYYY-MM-DD')
#
#
# "还剩下#{duration.minute}分#{duration.second}秒#{duration.ms}毫秒"