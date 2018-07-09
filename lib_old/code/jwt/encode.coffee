jwt = require('jsonwebtoken')



module.exports = encode = ( payload, secret, maxAge = 0 ) =>

   ########################################
   #|
   #|   @params {object} payload
   #|   @params {string} secret
   #|   @params {number} maxAge ( seconds or https://www.npmjs.com/package/ms )
   #|
   #|   @return {string} token
   #|
   ########################################

   opt =
      expiresIn: maxAge

   return jwt.sign( payload, secret, opt )