require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      data = await sai.readJSON('test/file/_assets/test2.json')
      console.log(data);


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





