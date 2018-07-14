require('coffeescript/register')
lodash = require('lodash')


module.exports = sai = require('./lib')



// switcher = new sai.Switcher(['a', 1, true])
//
// console.log(switcher._result)
// console.log(switcher.result())





;(async function(){


})()


try {
   switcher = new sai.Switcher(1)
   switcher.case(String, 'b', 'c')
   console.log(switcher.result())

} catch (error) {
   console.log(error.name)
   console.log(error.message)
}




