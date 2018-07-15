suite "isArrayLike", ->

   test "isArrayLike([1, 2, 3])",         -> sai.isArrayLike([1, 2, 3]).should.be.true
   test "isArrayLike(new Array)",         -> sai.isArrayLike(new Array).should.be.true

   test "isArrayLike(arguments)",         -> sai.isArrayLike(arguments).should.be.true
   test "isArrayLike('abc')",             -> sai.isArrayLike('abc').should.be.true
   test "isArrayLike(new Buffer('abc'))", -> sai.isArrayLike(new Buffer('abc')).should.be.true