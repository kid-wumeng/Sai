contain  = require('../../core/contain')
mime_    = require('../../file/mime')
isArray  = require('../isArray')
isString = require('../isString')
isBuffer = require('../isBuffer')


module.exports = ( value, mimes ) ->

   ########################################
   #|
   #|   @params {*}          value
   #|   @params {Array-like} mimes
   #|
   #|   @return {boolean}    result
   #|
   ########################################

   # @TODO 补充测试用例

   if isString(mimes)
      mimes = [mimes]

   if !isArray(mimes)
      return false

   return isBuffer(value) and contain(mimes, mime_(value))