errors    = require('../../errors')
error     = require('../../core/error')
isObject  = require('../../is/isObject')
isString  = require('../../is/isString')
isBoolean = require('../../is/isBoolean')
isN       = require('../../is/isN')
isArray   = require('../../is/isArray')


module.exports = ( options = {} ) ->

   ########################################
   #|
   #|   @params {object} options
   #|   @return {object} options
   #|
   ########################################

   if !isObject(options)
      throw error({ name: errors.INVALID_PARAMS, message: "`options` should be an object" })

   rawOptions = {}

   _formatSortAndDesc.call(@, options, rawOptions)
   _formatSkipAndPageAndSize.call(@, options, rawOptions)
   _formatPickAndOmitAndHide.call(@, options, rawOptions)

   return rawOptions




_formatSortAndDesc = ( options, rawOptions ) ->

   sort = options.sort ? '_id'
   desc = options.desc ? false

   if !isString( sort )
      throw error({ name: errors.INVALID_PARAMS, message: "`options.sort` should be a string" })

   if !isBoolean( desc )
      throw error({ name: errors.INVALID_PARAMS, message: "`options.desc` should be a boolean" })

   rawOptions.sort = {}

   if desc
      rawOptions.sort[sort] = -1
   else
      rawOptions.sort[sort] = 1




_formatSkipAndPageAndSize = ( options, rawOptions ) ->

   page = options.page ? 1
   size = options.size ? 0
   skip = options.skip ? 0

   if !isN( page )
      throw error({ name: errors.INVALID_PARAMS, message: "`options.page` should be a natural-number" })

   if !isN( size )
      throw error({ name: errors.INVALID_PARAMS, message: "`options.size` should be a natural-number" })

   if !isN( skip )
      throw error({ name: errors.INVALID_PARAMS, message: "`options.skip` should be a natural-number" })

   rawOptions.kip  = skip + ( page - 1 ) * size
   rawOptions.limit = size




_formatPickAndOmitAndHide = ( options, rawOptions ) ->

   pick = options.pick ? []
   omit = options.omit ? []
   hide = options.hide ? false

   if !isArray( pick )
      throw error({ name: errors.INVALID_PARAMS, message: "`options.pick` should be an Array" })

   if !isArray( omit )
      throw error({ name: errors.INVALID_PARAMS, message: "`options.omit` should be an Array" })

   if !isBoolean( hide )
      throw error({ name: errors.INVALID_PARAMS, message: "`options.hide` should be a boolean" })

   if pick.length and omit.length
      throw error({ name: errors.INVALID_PARAMS, message: "Can't set `options.pick` and `options.omit` at the same time" })

   if !hide and !pick.length and @_hides.length
      omit = omit.concat(@_hides)

   if pick.length
      rawOptions.projection = pick.join(' ')

   if omit.length
      omit = omit.map (name) => '-' + name
      rawOptions.projection = omit.join(' ')