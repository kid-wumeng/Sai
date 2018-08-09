require('coffeescript/register')
require('colors')
moment = require('moment')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      console.log(sai.max(12, 4, -2.6, 3.2));


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





