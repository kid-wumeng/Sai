errors = require('../../errors')
error  = require('../../core/error')
isN    = require('../../is/isN')


module.exports = ( count = 1 ) ->


   ########################################
   #|
   #|   Make one or some auto-increment ids and return the first.
   #|
   #|   @params {number} count
   #|   @return {number} startID
   #|
   ########################################


   if !isN(count)
      throw error({ name: errors.INVALID_PARAMS, message: "`count` should be a natural-number" })

   if count < 1
      throw error({ name: errors.INVALID_PARAMS, message: "`count` should be ≥ 1" })


   result = await @_db.col(@_autoIDStore).findOneAndUpdate({
      _id: @_name
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