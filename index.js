require('coffeescript/register')
lodash = require('lodash')


module.exports = sai = require('./lib')



// switcher = new sai.Switcher(['a', 1, true])
//
// console.log(switcher._result)
// console.log(switcher.result())



sai.get()




;(async function(){

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