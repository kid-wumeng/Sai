require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      value = sai.time(new Date)
      console.log(value);


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





