_          = require('lodash')
mongodb    = require('mongodb')
Collection = require('./store.MongoDB.Collection')



module.exports = class MongoDB



   constructor: ( opt = {} ) ->

      ########################################
      #|
      #|  @params {object} opt
      #|          {string} opt.host = '0.0.0.0'
      #|          {number} opt.port =  27017
      #|          {string} opt.name = 'test'
      #|          {string} opt.user
      #|          {string} opt.pass
      #|          {bool}   opt.autoID = false
      #|          {string} opt.autoIDCol
      #|
      ########################################

      @_host        = opt.host      ? '0.0.0.0'
      @_port        = opt.port      ?  27017
      @_name        = opt.name      ? 'test'
      @_user        = opt.user
      @_pass        = opt.pass
      @_autoID      = opt.autoID    ? false
      @_autoIDStore = opt.autoIDStore

      @_client = null
      @_db     = null
      @_cols   = {}
      @_hides  = {}





   connect: =>

      ########################################
      #|
      #|  Connect the database.
      #|
      #|  @async-function
      #|
      #|  @params {object} opt
      #|          {string} opt.host = '0.0.0.0'
      #|          {number} opt.port = 27017
      #|          {string} opt.name = 'test'
      #|          {string} opt.user
      #|          {string} opt.pass
      #|          {bool}   opt.autoID = false
      #|          {string} opt.autoIDCol
      #|
      ########################################

      uri = @_uri()

      @_client = await mongodb.MongoClient.connect(uri)

      @_db = @_client.db(@_name)

      if @_autoID
         await @_ensureAutoIDStore()

      return





   _uri: =>

      ########################################
      #|
      #|  Format and return a mongo's uri, reference:
      #|     https://docs.mongodb.com/manual/reference/connection-string/
      #|
      #|  @return {string} uri
      #|
      ########################################

      if @_user
         return "mongodb://#{@_user}:#{@_pass}@#{@_host}:#{@_port}/#{@_name}"
      else
         return "mongodb://#{@_host}:#{@_port}/#{@_name}"





   close: =>

      ########################################
      #|
      #|  Format and return a mongo's uri, reference:
      #|     https://docs.mongodb.com/manual/reference/connection-string/
      #|
      #|  @return {string} uri
      #|
      ########################################

      await @_client.close()





   drop: =>

      ########################################
      #|
      #|  Drop the database ( the connection will be kept ).
      #|
      #|  @async-function
      #|
      ########################################

      await @_db.dropDatabase()





   _ensureAutoIDStore: =>

      ########################################
      #|
      #|  @async-function
      #|  @errors
      #|
      ########################################

      if !@_autoIDStore
         throw "store.MongoDB._ensureAutoIDStore >>>
                You should set an { autoIDStore } when open the { autoID }."

      stores = await @col(@_autoIDStore).find()

      for store in stores
        await @_ensureAutoIDStoreEach(store)





   _ensureAutoIDStoreEach: ( store ) =>

      ########################################
      #|
      #|  @async-function
      #|  @errors
      #|
      ########################################

      col    = store._id
      lastID = store.lastID

      lastDoc = await @_db.collection(col).findOne({
         'id': $exists: true
      },{
         sort: 'id': -1
         projection: 'id': 1
      })

      if lastDoc and lastDoc.id > store.lastID
         throw "store.MongoDB._ensureAutoIDStore >>>
                See the collection { #{col} },
                the last-document's id is greater than { #{@_autoIDStore} }."





   hide: ( col, key ) =>

      ########################################
      #|
      #|  Hide the field when query.
      #|
      #|  @params {string} col
      #|  @params {string} key
      #|  @return {DB}     this
      #|
      ########################################

      if !@_hides[col]
        @_hides[col] = []
      @_hides[col].push(key)

      return this





   col: ( name ) =>

      ########################################
      #|
      #|  Select the collection ( singleton, create it at first ).
      #|
      #|  @params {string} name
      #|  @return {Collection}
      #|
      ########################################

      if !@_cols[name]

         @_cols[name] = new Collection({
            db:          @_db
            hides:       @_hides
            autoID:      @_autoID
            autoIDStore: @_autoIDStore
            name:        name
         })

      return @_cols[name]