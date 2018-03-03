_     = require('lodash')
array = require('../array')



module.exports = class Collection



   constructor: ( opt = {} ) ->

      ########################################
      #|
      #|  @params {object}     opt
      #|          {mongodb.Db} opt.db
      #|          {object}     opt.hides - { user: ['email', 'pass', ...], ... }
      #|          {bool}       opt.autoID
      #|          {string}     opt.autoIDStore
      #|          {string}     opt.name
      #|
      ########################################

      @_db          = opt.db
      @_hides       = opt.hides
      @_autoID      = opt.autoID
      @_autoIDStore = opt.autoIDStore
      @_name        = opt.name
      @_col         = @_db.collection(@_name)





   findOne: ( query = {}, opt = {} ) =>

      ########################################
      #|
      #|  @async-function
      #|
      #|  @params {object} query
      #|  @params {object} opt
      #|
      #|  @return {object} doc
      #|
      ########################################

      query = @_formatQuery(query)

      opt   = @_formatOptions(opt)

      return await @_col.findOne(query, opt)





   find: ( query = {}, opt = {} ) =>

      ########################################
      #|
      #|  @async-function
      #|
      #|  @params {object}   query
      #|  @params {object}   opt
      #|
      #|  @return {object[]} docs
      #|
      ########################################

      query = @_formatQuery(query)

      opt   = @_formatOptions(opt)

      return await @_col.find(query, opt).toArray()





   count: ( query = {}, opt = {} ) =>

      ########################################
      #|
      #|  @async-function
      #|
      #|  @params {object} query
      #|  @params {object} opt
      #|
      #|  @return {number} count
      #|
      ########################################

      query = @_formatQuery(query)

      opt   = @_formatOptions(opt)

      return await @_col.count(query, opt)





   _formatQuery: ( query = {} ) =>

      ########################################
      #|
      #|  @params {object|number} query | doc's id
      #|  @return {object}        query
      #|
      ########################################

      if _.isFinite(query)
         query =
            id: query

      return Object.assign({}, query)





   _formatOptions: ( opt = {} ) =>

      ########################################
      #|
      #|  @params {object|string} opt | projection
      #|  @return {object}        opt
      #|
      ########################################

      if _.isString(opt)
         opt =
            projection: opt

      opt = Object.assign({}, opt)

      @_formatOptions_sort(opt)
      @_formatOptions_page(opt)
      @_formatOptions_projection(opt)
      @_formatOptions_hide(opt)

      return opt



   _formatOptions_sort: ( opt ) =>

      ########################################
      #|
      #|  @params {object|string} opt
      #|
      ########################################

      if _.isNumber(opt.sort)
         opt.sort =
            _id: opt.sort

      return





   _formatOptions_page: ( opt ) =>

      ########################################
      #|
      #|  @params {object} opt
      #|
      ########################################

      page = opt.page ? 1
      size = opt.size ? 0
      skip = opt.skip ? 0

      opt.skip  = skip + ( page - 1 ) * size
      opt.limit = size

      delete opt.page
      delete opt.size

      return



   _formatOptions_projection: ( opt ) =>

      ########################################
      #|
      #|  @params {object} opt
      #|
      ########################################

      opt.projection ?= {}

      if _.isString( opt.projection )

         # {string} => {array} => {dict}
         # eg:
         #    'name age'   => ['name', 'age']   => { name: 1, age: 1 }
         #    '-name -age' => ['-name', '-age'] => { name: 0, age: 0 }

         string = opt.projection
         array = string.split(/\s+/)
         dict = {}

         for key in array

            if key[0] is '-'
               key = key.slice(1)
               dict[key] = 0

            else
               dict[key] = 1

         opt.projection = dict

      return





   _formatOptions_hide: ( opt ) =>

      ########################################
      #|
      #|  Call this method must after @_formatOptions_projection(),
      #|  because it is depend on {opt.projection}
      #|
      #|  @params {object} opt
      #|
      ########################################

      hideKeys = @_hides[@_name]

      if !hideKeys
         return

      if opt.hide is true
         return

      if Object.values(opt.projection)[0] is 1
         return

      for key in hideKeys
        opt.projection[key] = 0

      return





   insertOne: ( doc = {} ) =>

      ########################################
      #|
      #|  @async-function
      #|
      #|  @params {object} doc
      #|  @return {object} doc ( includes _id, id and createDate )
      #|
      ########################################

      if !doc.id and @_autoID
          doc.id = await @_makeIDs()

      if !doc.createDate
          doc.createDate = new Date()

      result = await @_col.insertOne(doc)

      return result.ops[0]





   insertMany: ( docs = [] ) =>

      ########################################
      #|
      #|  @async-function
      #|
      #|  @params {object} docs
      #|  @return {object} docs ( includes _id, id and createDate )
      #|
      ########################################

      if @_autoID
         count = array.count(docs, (doc) -> !doc.id)
         start = await @_makeIDs(count)

      for doc in docs

         if !doc.id and @_autoID
             doc.id = start
             start++

         if !doc.createDate
             doc.createDate = new Date()

      result = await @_col.insertMany(docs)

      return result.ops





   _makeIDs: ( count = 1 ) =>

      ########################################
      #|
      #|  Make one or some auto-increment ids and return the first.
      #|
      #|  @async-function
      #|
      #|  @params {number} count
      #|  @return {number} startID
      #|
      ########################################

      result = await @_db.collection(@_autoIDStore).findOneAndUpdate({
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





   findOneAndUpdate: ( query = {}, modifier = {} ) =>

      ########################################
      #|
      #|  @async-function
      #|
      #|  @params {object} query
      #|  @params {object} modifier
      #|
      #|  @return {object} new-doc
      #|
      ########################################

      query    = @_formatQuery(query)

      modifier = @_formatModifier(modifier)

      opt      = { returnOriginal: false }

      result   = await @_col.findOneAndUpdate(query, modifier, opt)

      return result.value





   updateOne: ( query = {}, modifier = {} ) =>

      ########################################
      #|
      #|  @async-function
      #|
      #|  @params {object} query
      #|  @params {object} modifiedCount
      #|
      #|  @return {object} new-doc
      #|
      ########################################

      query    = @_formatQuery(query)

      modifier = @_formatModifier(modifier)

      result   = await @_col.updateOne(query, modifier)

      return result.modifiedCount





   updateMany: ( query = {}, modifier = {} ) =>

      ########################################
      #|
      #|  @async-function
      #|
      #|  @params {object} query
      #|  @params {object} modifier
      #|
      #|  @return {number} modifiedCount
      #|
      ########################################

      query    = @_formatQuery(query)

      modifier = @_formatModifier(modifier)

      result   = await @_col.updateMany(query, modifier)

      return result.modifiedCount





   _formatModifier: ( modifier={} ) =>

      ########################################
      #|
      #|  @params {object} modifier
      #|  @return {object} modifier
      #|
      ########################################

      modifier = Object.assign({}, modifier)

      modifier.$set ?= {}
      modifier.$set.updateDate = new Date()

      for key, value of modifier

         if key[0] is '$'

            # $inc, $push...

            if @_autoID
               delete value.id

         else
            modifier.$set[key] = value
            delete modifier[key]

      return modifier





   deleteOne: ( query = {} ) =>

      ########################################
      #|
      #|  @params {object} query
      #|
      #|  @return {number} deletedCount
      #|
      ########################################

      query  = @_formatQuery(query)

      result = await @_col.deleteOne(query)

      return result.deletedCount





   deleteMany: ( query = {} ) =>

      ########################################
      #|
      #|  @params {object} query
      #|
      #|  @return {number} deletedCount
      #|
      ########################################

      query  = @_formatQuery(query)

      result = await @_col.deleteMany(query)

      return result.deletedCount





   aggregate: ( pipeline, opt = {} ) =>

      ########################################
      #|
      #|  @params {object[]} pipeline
      #|  @params {object}   opt
      #|
      #|  @return {object[]} results
      #|
      ########################################

      return await @_col.aggregate( pipeline, opt ).toArray()