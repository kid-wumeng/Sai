suite "isString", ->

   test "isString('abc')",             -> sai.isString('abc').should.be.true
   test "isString(new String('abc'))", -> sai.isString(new String('abc')).should.be.true
   test "isString(new Buffer('abc'))", -> sai.isString(new Buffer('abc')).should.be.false