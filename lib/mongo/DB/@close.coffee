module.exports = ->

   await @_client.close()

   @_client = null
   @_db     = null