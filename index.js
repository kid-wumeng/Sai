require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      text = await sai.readText('./test/file/_assets/test.txt')
      await sai.writeText('./test/file/_assets/test2.txt', text)

      console.log(text);


   } catch (error) {
      console.log(error.name.red)
      console.log(error.message.red)
   }

})()





