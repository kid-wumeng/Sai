require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      file = await sai.readFile('./test/file/_assets/test.png')
      await sai.writeFile('./test/file/_assets/test2.png', file)

      console.log(file);


   } catch (error) {
      console.log(error.name.red)
      console.log(error.message.red)
   }

})()





