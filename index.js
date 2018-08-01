require('coffeescript/register')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {

      sai.test({name: 'ddddabc'}, 'name').required().int()

   } catch (error) {
      console.log(error.name)
      console.log(error.message)
   }

})()





