require('coffeescript/register')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {

      schema = new sai.Schema
      tester = new sai.Tester({name: 6}, 'name')
      tester.name('测试用户名')
      tester.schema(schema)

      tester.required().in(['6', 7, 8])

   } catch (error) {
      console.log(error.name)
      console.log(error.message)
   }

})()





