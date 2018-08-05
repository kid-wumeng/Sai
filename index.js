require('coffeescript/register')
require('colors')
_ = require('lodash')



module.exports = sai = require('./lib')



;(async function(){

   try {


      db = new sai.mongo.DB({

      })

      await db.connect()

      col = db.col('users')

      console.log(await col.findOne({}, {
         desc: true
      }));



   } catch (error) {
      // console.log(error.name.red)
      console.log(error.message.red)
   }

})()





