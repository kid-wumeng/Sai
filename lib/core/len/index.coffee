size        = require('lodash/size')
isNumber    = require('../../is/isNumber')
isString    = require('../../is/isString')
isArrayLike = require('../../is/isArrayLike')
switch_     = require('../switch')



module.exports = ( args... ) ->

   ########################################
   #|
   #|   @params {*}        arguments...
   #|   @return {int ≥ 0} len
   #|
   ########################################

   return switch_(args)
      .case(String)
      .case(String, 'length').then( lenByLength )
      .case(String, 'cjk').then( lenByCJK )
      .case(Set).then( lenBySize )
      .case(Map).then( lenBySize )
      .case(isArrayLike).then( lenByLength )
      .case(isArrayLike, Function).then( lenArray )
      .case(Object, Function).then( lenObject )
      .default(size)
      .result()



lenByLength = ( array ) ->
   return array.length



lenBySize = ( array ) ->
   return array.size



lenByCJK = ( array ) ->
   return lenArray array, (char) ->
      if /[\u4E00-\u9FA5\uF900-\uFA2D]/.test(char)
         return 2
      else
         return 1



lenArray = ( array, callback ) ->

   len = 0

   for item, i in array
       itemLen = callback(item, i)
       if isNumber(itemLen)
          len += itemLen

   return len



lenObject = ( object, callback ) ->

   len = 0

   for name, value of object
       itemLen = callback(value, name)
       if isNumber(itemLen)
          len += itemLen

   return len