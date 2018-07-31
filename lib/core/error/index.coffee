isObject   = require('../../is/isObject')
isFunction = require('../../is/isFunction')


module.exports = ( error, others... ) ->

   ########################################
   #|
   #|   Create a native Error object.
   #|
   #|   @params {*}     error
   #|   @return {Error} error
   #|
   ########################################

   if isFunction(error)
      error = error(others...)

   if isObject(error)
      return Object.assign(new Error(), error)
   else
      return Object.assign(new Error(), { message: "#{error}" })