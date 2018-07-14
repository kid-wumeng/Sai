require('coffeescript/register')
lodash = require('lodash')


module.exports = sai = require('./lib')








;(async function(){

   try {

   a = {name: 'kid'}

   b = Object.assign({}, a, {age: 18})

   console.log(sai.isEqual(a, b))



   } catch (error) {
      console.log(error.name)
      console.log(error.message)
   }

})()





