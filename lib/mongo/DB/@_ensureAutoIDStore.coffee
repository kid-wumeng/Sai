errors    = require('../../errors')
error     = require('../../core/error')


module.exports = ->

   if @_autoID is true

      records = await @col(@_autoIDStore).find()

      for record in records
         await _ensureEach.call(@, record)



_ensureEach = ( record ) ->

   col    = record._id
   lastID = record.lastID

   lastDoc = await @col(col).findOne({
      'id': $exists: true
   },{
      sort: 'id'
      desc: true
      pick: ['id']
   })

   if lastDoc and lastDoc.id > record.lastID

      throw "See the collection `#{col}`,
             the last-document's id is greater than `#{@_autoIDStore}`"