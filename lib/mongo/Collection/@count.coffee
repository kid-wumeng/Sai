module.exports = ( queries = {}, options = {} ) ->

   ########################################
   #|
   #|   @params {object} queries
   #|   @params {object} options
   #|
   #|   @return {number} count
   #|
   ########################################

   queries = @_formatQueries(queries)
   options = @_formatOptions(options)

   return await @_col.count(queries, options)