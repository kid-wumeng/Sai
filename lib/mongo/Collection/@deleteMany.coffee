module.exports = ( queries = {} ) ->

   ########################################
   #|
   #|   @params {object} queries
   #|   @return {number} deletedCount
   #|
   ########################################

   queries = @_formatQueries(queries)
   result  = await @_col.deleteMany(queries)

   return result.deletedCount