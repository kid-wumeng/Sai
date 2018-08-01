require('coffeescript/register')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {

      schema = new sai.Schema
      schema.test({name: 'ddddabc'}, 'name').required().int()

   } catch (error) {
      console.log(error.name)
      console.log(error.message)
   }

})()





