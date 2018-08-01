require('coffeescript/register')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {

      schema = new sai.Schema
      tester = new sai.Tester({name: 'ddddabc'}, 'name')
      tester.name('测试用户名')
      tester.schema(schema)

      schema.rule('user.name', function(data){
         tester.number()
      })

      tester.required().rule('user.name', ({rule})=>rule + ' err')

   } catch (error) {
      console.log(error.name)
      console.log(error.message)
   }

})()





