require('coffeescript/register')
require('colors')
moment = require('moment')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      array = ['a', 'b', 'c']

      item = sai.randomItem(array, isPop = true)

      console.log(item);
      console.log(array);


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





