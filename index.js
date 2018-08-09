require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      data = await sai.readYAML('test/file/_assets/test.yaml')
      console.log(data);


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





