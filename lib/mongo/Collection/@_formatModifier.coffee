errors   = require('../../errors')
error    = require('../../core/error')
clone    = require('../../core/clone')
isObject = require('../../is/isObject')


module.exports = ( modifier = {} ) ->

   ########################################
   #|
   #|   @params {object} modifier
   #|   @return {object} modifier
   #|
   ########################################

   if !isObject(modifier)
      throw error({ name: errors.INVALID_PARAMS, message: "`modifier` should be an object" })

   modifier = clone(modifier)

   modifier.$set ?= {}
   modifier.$set.updateDate = new Date()

   for name, value of modifier
      if name[0] isnt '$'
         modifier.$set[name] = value
         delete modifier[name]

   return modifier