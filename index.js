require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      db = new sai.mongo.DB({
         autoID: true,
         autoIDStore: 'xxx'
      })

      await db.connect()
      await db.drop()

      db.col('users').hide('id')
      users = await db.col('users').insertOne({ name: 'kid' })

      console.log(users);


   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





