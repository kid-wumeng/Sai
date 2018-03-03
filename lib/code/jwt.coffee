jwt = require('jsonwebtoken')



exports.encode = ( payload, secret, maxAge = 0 ) =>

   ########################################
   #|
   #|  @params {object} payload
   #|  @params {string} secret
   #|  @params {number} maxAge
   #|
   #|  @return {string} token
   #|
   ########################################

   opt =
      expiresIn: maxAge

   return jwt.sign( payload, secret, opt )





exports.decode = ( token, secret ) =>

   ########################################
   #|
   #|  @params {string} token
   #|  @params {string} secret
   #|
   #|  @return {object} payload
   #|
   ########################################

   return jwt.verify( token, secret )