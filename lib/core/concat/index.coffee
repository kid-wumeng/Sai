isArrayLike = require('../../is/isArrayLike')
isString    = require('../../is/isString')


module.exports = ( itemOrArrays... ) ->

   ########################################
   #|
   #|   @params {*}     itemOrArrays
   #|   @return {Array} array
   #|
   ########################################

   array = []

   for value in itemOrArrays
      if isArrayLike(value) and !isString(value)
         for item in value
            array.push(item)
      else
         array.push(value)

   return array