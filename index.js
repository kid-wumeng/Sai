require('coffeescript/register')
_ = require('lodash')



module.exports = sai = require('./lib')





;(async function(){

   try {

      aaa = sai.indexOf([{name: 'kid'}, {name: 'kid'}], {name: 'kid'}, 1)

      console.log(aaa);


   } catch (error) {
      console.log(error.name)
      console.log(error.message)
   }

})()





