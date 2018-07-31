errors     = require('../../errors')
error      = require('../../core/error')
isString   = require('../../is/isString')
isFunction = require('../../is/isFunction')


module.exports = ( name, check ) ->

   ########################################
   #|
   #|   SET
   #|      @params {string}     name
   #|      @params {function}   check
   #|      @return {sai.Schema} @
   #|
   #|   GET
   #|      @params {string}   name
   #|      @return {function} check
   #|
   ########################################

   if !isString(name)
      throw error({ name: errors.INVALID_PARAMS, message: "`name` should be a string." })

   if check and !isFunction(check)
      throw error({ name: errors.INVALID_PARAMS, message: "`check` should be a function." })

   if check
      @_rules[name] = check
      return @
   else
      return @_rules[name]