require('coffeescript/register')
require('colors')
moment = require('moment')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      from = new Date(2016, 3, 15, 12, 35, 8, 789)
      to   = new Date(2018, 5, 12, 6, 15, 45, 666)

      duration = new sai.Duration(from, to)

      console.log(duration.monthsBit());


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





