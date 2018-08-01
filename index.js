require('coffeescript/register')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {

      callback = ({ name }, message) => {
         return { name, message }
      }

      error = sai.error(callback, {name: 'INVALID_PARAMS'}, "this is an error !")

      console.log(error.name);
      console.log(error.message);

      // schema = new sai.Schema
      // tester = new sai.Tester({name: 'ddddabc'}, 'name')
      // tester.name('测试用户名')
      // tester.schema(schema)
      //
      // schema.rule('user.name', function(data){
      //    tester.natural()
      // })
      //
      // tester.required().rule('user.name')

   } catch (error) {
      console.log(error.name)
      console.log(error.message)
   }

})()





