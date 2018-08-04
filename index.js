require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      token = sai.jwt.encode({id: 1, name: 'kid'}, 'secret')
      data = sai.jwt.verify(token, 'secret')

      console.log(data);


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





