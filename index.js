require('coffeescript/register')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      result = await sai.isDir('./test/file/_assets')

      console.log(result);


   } catch (error) {
      console.log(error.name)
      console.log(error.message)
   }

})()





