isFunction = require('../isFunction')


module.exports = ( value ) ->


   ########################################
   #|
   #|   @params {*}       value
   #|   @return {boolean} result
   #|
   ########################################


   return isFunction(value) and Object.getPrototypeOf(value).constructor.name is 'AsyncFunction'