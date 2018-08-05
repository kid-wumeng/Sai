errors   = require('../../errors')
error    = require('../../core/error')
count_   = require('../../core/count')
del      = require('../../core/del')
isArray  = require('../../is/isArray')
isObject = require('../../is/isObject')


module.exports = ( docs = [] ) ->


   ########################################
   #|
   #|   @async-function
   #|
   #|   @params {object} docs
   #|   @return {object} docs ( includes _id, id and createDate )
   #|
   ########################################


   if !isArray(docs)
      throw error({ name: errors.INVALID_PARAMS, message: "`docs` should be an Array" })


   for doc in docs
       if !isObject(doc)
           throw error({ name: errors.INVALID_PARAMS, message: "`doc` should be an object" })


   isAutoID = @_db.isAutoID()


   if isAutoID
      count = count_(docs, (doc) => !doc.id)
      start = await @_db.makeIDs(@_name, count)


   for doc in docs

      if !doc.id and isAutoID
          doc.id = start
          start++

      if !doc.createDate
          doc.createDate = new Date()


   result = await @_col.insertMany(docs)
   docs   = result.ops


   for doc in docs
       for name in @_hides
           del(doc, name)


   return docs