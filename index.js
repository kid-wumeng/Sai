require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      data = await sai.readFile('./test/file/_assets/test.png')

      console.log(sai.mime(''));


   } catch (error) {
      console.log(error.name.red)
      console.log(error.message.red)
   }

})()





