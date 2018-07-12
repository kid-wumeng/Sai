suite "isBuffer", ->

   test "isBuffer(new Buffer('abc'))", -> sai.isBuffer(new Buffer('abc')).should.be.true
   test "isBuffer(new String('abc'))", -> sai.isBuffer(new String('abc')).should.be.false