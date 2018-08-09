require('coffeescript/register')
require('colors')
moment = require('moment')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      array = ['a', 1, 6.4]

      sum = sai.sum(array)

      console.log(1.2 - 3.2 + 2.4);


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





