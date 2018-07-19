require('coffeescript/register')
_ = require('lodash')



module.exports = sai = require('./lib')





;(async function(){

   try {

      console.log(sai.random(20000, -20000));

   } catch (error) {
      console.log(error.name)
      console.log(error.message)
   }

})()





