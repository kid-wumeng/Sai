mongodb  = require('mongodb')
errors   = require('../../errors')
error    = require('../../core/error')
isString = require('../../is/isString')


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
      if isString(message)
         throw error({ name: errors.MONGO_DB_CONNECT_FAIL, message })
      else
         throw message

   return