require('coffeescript/register')
require('colors')
moment = require('moment')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      client = new sai.http.Client({
         urlBase: 'http://www.baidu.com/'
      })

      res = await client.send()
      console.log(res.status);


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





