global.should = require('chai').should()
global.expect = require('chai').expect
global.sai    = require('../')


suite '~core', ->
   require('./core/type')
   require('./core/get')
   require('./core/error')


suite '~is', ->
   require('./is/is')
   require('./is/isBoolean')
   require('./is/isNumber')
   require('./is/isInt')
   require('./is/isN')
   require('./is/isID')
   require('./is/isString')
   require('./is/isSymbol')
   require('./is/isFunction')
   require('./is/isAsyncFunction')
   require('./is/isArray')
   require('./is/isArrayLike')
   require('./is/isBuffer')
   require('./is/isRegExp')
   require('./is/isDate')
   require('./is/isError')
   require('./is/isPromise')
   require('./is/isObject')
   require('./is/isPlainObject')
   require('./is/isNil')
   require('./is/isNaN')