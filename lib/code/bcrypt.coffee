bcrypt = require('bcrypt-nodejs')



exports.encode = ( data ) =>

   ########################################
   #|
   #|  @async-function
   #|
   #|  @params {string} data
   #|  @return {string} hash
   #|
   ########################################

   return await new Promise (resolve, reject) =>

      bcrypt.genSalt null, (error, salt) =>

         if error
            reject(error)
         else
            bcrypt.hash data, salt, null, (error, hash) =>

               if error
                  reject(error)
               else
                  resolve(hash)





exports.compare = ( data, hash ) =>

   ########################################
   #|
   #|  @async-function
   #|
   #|  @params {string} data
   #|  @params {string} hash
   #|
   #|  @return {bool} isMatched
   #|
   ########################################

   return await new Promise (resolve, reject) =>

      bcrypt.compare data, hash, (error, result) =>

         if error
            reject(error)
         else
            resolve(result)