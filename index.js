require('coffeescript/register')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {

      schema = new sai.Schema
      tester = new sai.Tester({name: 6}, 'name')
      tester.name('测试用户名')
      tester.schema(schema)

      console.log(sai.isMin('768uuu', 6));

      // tester.required().check((data)=>{data > 78}, '应该大于78')

   } catch (error) {
      console.log(error.name)
      console.log(error.message)
   }

})()





