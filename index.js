require('coffeescript/register')
lodash = require('lodash')


module.exports = sai = require('./lib')


;(async function(){

   await sai.sleep(3000)
   console.log('--------');

})()


// return await sai.switch(args)
//    .case(String, 'length').then(_lenByModeLength)
//    .case([1, 2, 3], 1).rest().then(_lenByModeLength)
//    .case(sai.has('name'), 'cjk').then(_lenByModeCJK)
//    .default(error({
//       name: errors.INVALID_PARAMS
//       message: "this"
//    }))
//    .result()