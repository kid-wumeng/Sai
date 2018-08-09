require('coffeescript/register')
require('colors')
moment = require('moment')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      file = await sai.readFile('./test/file/_assets/test.png')

      sai.test(file).mime(['image/jpeg', 'image/png'])



   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





