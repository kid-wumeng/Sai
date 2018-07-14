Switcher = require('../Switcher')


module.exports = ( params, context ) ->

   ########################################
   #|
   #|   @params {Array-like}   params
   #|   @params {*}            context
   #|
   #|   @return {sai.Switcher} switcher
   #|
   ########################################

   return new Switcher( params, context )