module.exports = ( queries = {}, options = {} ) ->

   ########################################
   #|
   #|   @params {object} queries
   #|   @params {object} options
   #|
   #|   @return {object} doc
   #|
   ########################################

   queries = @_formatQueries(queries)
   options = @_formatOptions(options)

   return await @_col.findOne(queries, options)