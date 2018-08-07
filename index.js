require('coffeescript/register')
require('colors')
moment = require('moment')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      res = await sai.http.get('http://www.baidu.com/s', {wd: 'hjk'})
      console.log(res.data);


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





