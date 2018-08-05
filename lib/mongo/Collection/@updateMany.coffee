module.exports = ( queries = {}, modifier = {} ) ->

   ########################################
   #|
   #|   @params {object} queries
   #|   @params {object} modifier
   #|
   #|   @return {number} modifiedCount
   #|
   ########################################

   queries  = @_formatQueries(queries)
   modifier = @_formatModifier(modifier)

   result   = await @_col.updateMany(queries, modifier)

   return result.modifiedCount