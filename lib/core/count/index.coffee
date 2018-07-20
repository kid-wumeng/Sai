isArrayLike = require('../../is/isArrayLike')
switch_     = require('../switch')



module.exports = ( args... ) ->

   ########################################
   #|
   #|   @params {*}        arguments...
   #|   @return {int ≥ 0} count
   #|
   ########################################

   return switch_(args)
      .case(isArrayLike, Function).then(countArrayLike)
      .case(Set,         Function).then(countSet)
      .case(Map,         Function).then(countMap)
      .case(Object,      Function).then(countObject)
      .default(0)
      .result()



countArrayLike = ( array, callback ) ->
   count = 0
   for item, i in array
      if callback(item, i, array)
         count++
   return count



countSet = ( set, callback ) ->
   count = 0
   set.forEach (value, key) ->
      if callback(value, key, set)
         count++
   return count



countMap = ( map, callback ) ->
   count = 0
   map.forEach (value, key) ->
      if callback(value, key, map)
         count++
   return count



countObject = ( object, callback ) ->
   count = 0
   for name, value of object
      if callback(value, name, object)
         count++
   return count