bcrypt = require('bcrypt-nodejs')



module.exports = compare = ( data, hash ) =>

   ########################################
   #|
   #|   @async-function
   #|
   #|   @params {string} data
   #|   @params {string} hash
   #|
   #|   @return {bool} isMatched
   #|
   ########################################

   return await new Promise (resolve, reject) =>

      bcrypt.compare data, hash, (error, result) =>

         if error
            reject(error)
         else
            resolve(result)