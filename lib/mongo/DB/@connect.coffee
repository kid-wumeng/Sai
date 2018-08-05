mongodb  = require('mongodb')
errors   = require('../../errors')
error    = require('../../core/error')
isObject = require('../../is/isObject')


module.exports = ->

   ########################################
   #|
   #|   Connect the database.
   #|
   ########################################

   try
      uri = @uri()

      @_client = await mongodb.MongoClient.connect(uri, { useNewUrlParser: true })
      @_db     = @_client.db(@_name)

      await @_ensureAutoIDStore()

   catch message
      throw error({ name: errors.MONGO_DB_CONNECT_FAIL, message })

   return