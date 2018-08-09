mime_    = require('../../file/mime')
isString = require('../isString')
isBuffer = require('../isBuffer')


module.exports = ( value, mime ) ->

   ########################################
   #|
   #|   @params {*}       value
   #|   @params {string}  mime
   #|
   #|   @return {boolean} result
   #|
   ########################################

   # @TODO 补充测试用例

   if !isString(mime)
      return false

   return isBuffer(value) and mime_(value) is mime