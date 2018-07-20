require('coffeescript/register')
_ = require('lodash')



module.exports = sai = require('./lib')





;(async function(){

   try {

      console.log(sai.count(null, () => true));

   } catch (error) {
      console.log(error.name)
      console.log(error.message)
   }

})()





