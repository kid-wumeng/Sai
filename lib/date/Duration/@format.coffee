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


   yyyy = @years()
   mm   = @months()
   dd   = @days()
   hh   = @hours()
   ii   = @minutes()
   ss   = @seconds()


   return format.replace /(yyyy|mm|dd|hh|ii|ss)/g, ( placeholder ) =>
      switch placeholder
         when 'yyyy' then yyyy
         when 'mm'   then mm
         when 'dd'   then dd
         when 'hh'   then hh
         when 'ii'   then ii
         when 'ss'   then ss