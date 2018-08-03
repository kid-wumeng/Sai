require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      await sai.emptyDir('./test/file/_assets/test.json')


   } catch (error) {
      console.log(error.name.red)
      console.log(error.message.red)
   }

})()





