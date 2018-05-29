fileType = require('file-type')



module.exports = mime = ( data ) =>

   ########################################
   #|
   #|   @params {Uint8Array|node.Buffer}
   #|   @return {string} mime - 'image/png' ... 
   #|
   ########################################

   return fileType(data).mime