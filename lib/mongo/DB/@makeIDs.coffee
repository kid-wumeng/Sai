errors   = require('../../errors')
error    = require('../../core/error')
isString = require('../../is/isString')
isN      = require('../../is/isN')


module.exports = ( col, count = 1 ) ->


   ########################################
   #|
   #|   Make one or some auto-increment ids and return the first.
   #|
   #|   @params {number} count
   #|   @return {number} startID
   #|
   ########################################


   if !isString(col)
      throw error({ name: errors.INVALID_PARAMS, message: "`col` should be a string" })

   if !isN(count)
      throw error({ name: errors.INVALID_PARAMS, message: "`count` should be a natural-number" })

   if count < 1
      throw error({ name: errors.INVALID_PARAMS, message: "`count` should be ≥ 1" })

   if !@_autoID
      throw error({ name: errors.INVALID_PARAMS, message: "this DB don't set `autoID`" })

   if !@_autoIDStore
      throw error({ name: errors.INVALID_PARAMS, message: "this DB don't set `autoIDStore`" })


   result = await @_db.collection(@_autoIDStore).findOneAndUpdate({
      _id: col
   },{
      $inc:
         lastID: count
   },{
      upsert: true
      returnOriginal: false
   })


   lastID  = result.value.lastID
   startID = lastID - (count - 1)


   return startID