require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      db = new sai.mongo.DB({

      })

      await db.connect()

      db.col('users').hide('id')
      users = await db.col('users').updateMany({}, {age: 222})

      console.log(users);



   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





