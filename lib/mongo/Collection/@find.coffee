module.exports = ( queries = {}, options = {} ) ->

   ########################################
   #|
   #|   @params {object}   queries
   #|   @params {object}   options
   #|
   #|   @return {object[]} docs
   #|
   ########################################

   queries = @_formatQueries(queries)
   options = @_formatOptions(options)

   return await @_col.find(queries, options).toArray()