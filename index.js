require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      salt = await sai.bcrypt.salt(10)
      console.log(salt);
      hash = await sai.bcrypt.hash('12345678', salt)
      console.log(hash);
      result = await sai.bcrypt.compare('12345678', hash)
      console.log(result);


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





