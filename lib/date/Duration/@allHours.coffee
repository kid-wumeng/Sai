moment    = require('moment')
errors    = require('../../errors')
error     = require('../../core/error')
isBoolean = require('../../is/isBoolean')


module.exports = ( float = false )->

   #######################################
   #|
   #|   @return {number ≥ 0} allHours
   #|
   ########################################

   if !isBoolean( float )
      throw error({ name: errors.INVALID_PARAMS, message: "`float` should be a boolean" })

   from = moment(@_from)
   to   = moment(@_to)

   return to.diff(from, 'hours', float)