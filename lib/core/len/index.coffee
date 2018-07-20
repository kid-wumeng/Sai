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
      .case(isArrayLike, Function).then( lenArrayLike )
      .case(Set,         Function).then( lenSet )
      .case(Map,         Function).then( lenMap )
      .case(Object,      Function).then( lenObject )
      .default(size)
      .result()



lenByLength = ( array ) ->
   return array.length



lenBySize = ( array ) ->
   return array.size



lenByCJK = ( array ) ->
   return lenArrayLike array, (char) ->
      if /[\u4E00-\u9FA5\uF900-\uFA2D]/.test(char)
         return 2
      else
         return 1



lenArrayLike = ( array, callback ) ->

   len = 0

   for item, i in array
       itemLen = callback(item, i, array)
       if isNumber(itemLen)
          len += itemLen

   return len



lenSet = ( set, callback ) ->

   len = 0

   set.forEach (value, key) ->
      itemLen = callback(value, key, set)
      if isNumber(itemLen)
         len += itemLen

   return len



lenMap = ( map, callback ) ->

   len = 0

   map.forEach (value, key) ->
      itemLen = callback(value, key, map)
      if isNumber(itemLen)
         len += itemLen

   return len



lenObject = ( object, callback ) ->

   len = 0

   for name, value of object
       itemLen = callback(value, name, object)
       if isNumber(itemLen)
          len += itemLen

   return len