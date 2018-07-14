require('coffeescript/register')
lodash = require('lodash')


module.exports = sai = require('./lib')



// switcher = new sai.Switcher(['a', 1, true])
//
// console.log(switcher._result)
// console.log(switcher.result())





;(async function(){


})()


switcher = new sai.Switcher(['a', 'b'])


switcher.case(String, 'b')


console.log(switcher._caseMatched);