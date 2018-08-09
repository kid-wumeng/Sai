require('coffeescript/register')
require('colors')
moment = require('moment')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      file = await sai.readFile('./test/file/_assets/test.png')

      console.log(sai.isMIME(file, ['image/gif', 'image/jpeg']));


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





