require('coffeescript/register')
_ = require('lodash')



module.exports = sai = require('./lib')





;(async function(){

   try {


      protocol = 'http'

      console.log(sai.match('http://google.com', `^${protocol}://google.com$`))
      console.log(sai.match('file://google.com', `^${protocol}://google.com$`))



   } catch (error) {
      console.log(error.name)
      console.log(error.message)
   }

})()





