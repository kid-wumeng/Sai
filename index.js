require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      str = sai.yaml.stringify(true)
      console.log(str);
      console.log(sai.yaml.parse(str));


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





