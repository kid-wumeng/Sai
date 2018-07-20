require('coffeescript/register')
_ = require('lodash')



module.exports = sai = require('./lib')





;(async function(){

   try {

      console.log(sai.merge({}, 'abc'));

   } catch (error) {
      console.log(error.name)
      console.log(error.message)
   }

})()





