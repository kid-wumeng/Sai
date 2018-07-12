global.should = require('chai').should()
global.expect = require('chai').expect
global.sai    = require('../')


suite '~core', ->
   require('./core/type')


suite '~is', ->
   require('./is/is')
   require('./is/isBoolean')
   require('./is/isNumber')
   require('./is/isInt')
   require('./is/isN')
   require('./is/isID')
   require('./is/isString')
   require('./is/isNaN')