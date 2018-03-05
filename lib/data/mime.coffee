fileType = require('file-type')



module.exports = mime = ( data ) =>

   ########################################
   #|
   #|  @params {Uint8Array|node.Buffer}
   #|  @return {bool}
   #|
   ########################################

   return fileType(data).mime