errors       = require('../../errors')
error_       = require('../../core/error')
is_          = require('../../is/is')
isString     = require('../../is/isString')
isFunction   = require('../../is/isFunction')
Schema       = require('../Schema')
_displayData = require('./_displayData')
_displayName = require('./_displayName')


module.exports = ( rule, error ) ->


   ########################################
   #|
   #|   @params {number} min
   #|   @params {*}     [error]
   #|
   #|   @return {sai.Tester} @
   #|
   ########################################


   if !isString(rule)
      throw error_({ name: errors.INVALID_PARAMS, message: "`rule` should be a string" })

   if !is_(@_schema, Schema)
      throw error_({ name: errors.INVALID_PARAMS, message: "the tester has not a schema" })

   if !isFunction(check = @_schema.rule(rule))
      throw error_({ name: errors.INVALID_PARAMS, message: "the rule '#{rule}' is not found" })


   try
      check(@_data)
   catch errorInRule
      if error
         throw error_(error, {
            data: @_data
            path: @_path
            name: @_name
            rule: rule
         })
      else
         throw errorInRule


   return @