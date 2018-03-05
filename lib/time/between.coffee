module.exports = between = ( start, end ) =>

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