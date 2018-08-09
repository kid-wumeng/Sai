errors   = require('../../errors')
error    = require('../../core/error')
isNumber = require('../../is/isNumber')


module.exports = ( numbers... ) ->


   ########################################
   #|
   #|   @params {number...}
   #|   @return {number} min
   #|
   ########################################


   if numbers.length is 0
      throw error({ name: errors.INVALID_PARAMS, message: "It should has one `number` at least" })


   for number in numbers
       if !isNumber(number)
          throw error({ name: errors.INVALID_PARAMS, message: "`number` should be a number" })


   min = numbers.shift()

   for number in numbers
       if number < min
          min = number

   return min