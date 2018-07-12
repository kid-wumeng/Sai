suite "isArray", ->

   test "isArray([1, 2, 3])",         -> sai.isArray([1, 2, 3]).should.be.true
   test "isArray(new Array)",         -> sai.isArray(new Array).should.be.true

   test "isArray(arguments)",         -> sai.isArray(arguments).should.be.false
   test "isArray('abc')",             -> sai.isArray('abc').should.be.false
   test "isArray(new Buffer('abc'))", -> sai.isArray(new Buffer('abc')).should.be.false