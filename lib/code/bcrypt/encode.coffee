bcrypt = require('bcrypt-nodejs')



module.exports = encode = ( data ) =>

   ########################################
   #|
   #|   @async-function
   #|
   #|   @params {string} data
   #|   @return {string} hash
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