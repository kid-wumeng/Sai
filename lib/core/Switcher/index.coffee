isArrayLike = require('../../is/isArrayLike')
errors      = require('../../errors')
error       = require('../error')



module.exports = class Switcher

   constructor: ( params, context ) ->

      ########################################
      #|
      #|   @params {Array-like} params
      #|   @params {*}          context
      #|
      #|   @return {sai.Switcher}
      #|
      ########################################

      if !isArrayLike( params )
         throw error({ name: errors.INVALID_PARAMS, message: "`params` should be an Array-like" })

      @_params  = params
      @_context = context
      @_matched = false       # if true, means current @case is matched
      @_over    = false       # if true, ignore others @case, @then, @default
      @_result  = undefined   # record the @then's value by matched @case ( if not matched, is @default's value )

      @case    = require('./@case')
      @then    = require('./@then')
      @default = require('./@default')
      @result  = require('./@result')