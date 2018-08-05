errors   = require('../../errors')
error    = require('../../core/error')
del      = require('../../core/del')
isObject = require('../../is/isObject')


module.exports = ( doc = {} ) ->


   ########################################
   #|
   #|   @params {object} doc
   #|   @return {object} doc ( includes _id, id and createDate )
   #|
   ########################################


   if !isObject(doc)
      throw error({ name: errors.INVALID_PARAMS, message: "`doc` should be an object" })


   if !doc.id and @_db.isAutoID()
       doc.id = await @_db.makeIDs(@_name)


   if !doc.createDate
       doc.createDate = new Date()


   result = await @_col.insertOne(doc)
   doc    = result.ops[0]


   for name in @_hides
       del(doc, name)


   return doc