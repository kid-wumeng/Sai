require('coffeescript/register')
require('colors')
moment = require('moment')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      server = new sai.http.Server
      server.listen(5555)


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





