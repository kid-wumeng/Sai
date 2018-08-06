module.exports = ->


   #######################################
   #|
   #|   @return {int ≥ 0} allMonths
   #|
   ########################################


   fromYear        = @_from.getFullYear()
   fromMonth       = @_from.getMonth()
   fromDay         = @_from.getDate()
   fromHour        = @_from.getHours()
   fromMinute      = @_from.getMinutes()
   fromSecond      = @_from.getSeconds()
   fromMilliSecond = @_from.getMilliseconds()


   toYear        = @_to.getFullYear()
   toMonth       = @_to.getMonth()
   toDay         = @_to.getDate()
   toHour        = @_to.getHours()
   toMinute      = @_to.getMinutes()
   toSecond      = @_to.getSeconds()
   toMilliSecond = @_to.getMilliseconds()


   months = (toYear - fromYear) * 12 + (toMonth - fromMonth)


   if toDay > fromDay
      months += 1

   else if toDay is fromDay
        if toHour > fromHour
           months += 1

        else if toHour is fromHour
             if toMinute > fromMinute
                months += 1

             else if toMinute is fromMinute
                  if toSecond > fromSecond
                     months += 1

                  else if toSecond is fromSecond
                       if toMilliSecond > fromMilliSecond
                          months += 1


   return months