require('coffeescript/register')
lodash = require('lodash')


module.exports = sai = require('./lib')


error = sai.error(['a', 'b', 'c'])

console.log(error[0]);
console.log(error.message);
console.log(error.stack);


// return await sai.switch(args)
//    .case(String, 'length').then(_lenByModeLength)
//    .case([1, 2, 3], 1).rest().then(_lenByModeLength)
//    .case(sai.has('name'), 'cjk').then(_lenByModeCJK)
//    .default(error({
//       name: errors.INVALID_PARAMS
//       message: "this"
//    }))
//    .result()