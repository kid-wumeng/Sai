require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      result = await sai.readJSON('./test/file/_assets/test.json')

      console.log(typeof result);


   } catch (error) {
      console.log(error.name.red)
      console.log(error.message.red)
   }

})()





