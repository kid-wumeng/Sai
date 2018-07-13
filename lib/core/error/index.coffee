isObject = require('../../is/isObject')


module.exports = ( data ) ->


   ########################################
   #|
   #|   Create a native Error object
   #|
   #|   @params {*}     data
   #|   @return {Error} error
   #|
   ########################################


   error = new Error


   if isObject(data)
      Object.assign(error, data)
   else
      error.message = "#{data}"


   return error