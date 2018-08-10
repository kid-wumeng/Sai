Switcher = require('../Switcher')


module.exports = ( args, context ) ->

   ########################################
   #|
   #|   @params {Array-like}   args
   #|   @params {*}            context
   #|
   #|   @return {sai.Switcher} switcher
   #|
   ########################################

   return new Switcher( args, context )