global.should = require('chai').should()
global.expect = require('chai').expect
global.sai    = require('../')


suite '~core', ->
   require('./core/type')


suite '~is', ->
   require('./is/is')
   require('./is/isNaN')