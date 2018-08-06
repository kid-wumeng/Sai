require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      from = new Date(2018, 2, 20, 23, 2)
      to   = new Date(2018, 2, 20, 23, 2)

      duration = new sai.Duration(from, to)

      console.log(duration.allYears());


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





