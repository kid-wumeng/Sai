require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      await sai.writeYAML('test/file/_assets/test2.yaml', {user: {name: 'kid'}})


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





