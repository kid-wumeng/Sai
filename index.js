require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      await sai.writeJSON('test/file/_assets/test2.json', 'abc')


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





