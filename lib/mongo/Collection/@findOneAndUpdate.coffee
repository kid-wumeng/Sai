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
   options  = { returnOriginal: false }

   result   = await @_col.findOneAndUpdate(queries, modifier, options)

   return result.value