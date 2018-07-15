suite "isN", ->

   test "isN(1)",                -> sai.isN(1).should.be.true
   test "isN(0)",                -> sai.isN(0).should.be.true
   test "isN(-1)",               -> sai.isN(-1).should.be.false
   test "isN(+0.1)",             -> sai.isN(+0.1).should.be.false
   test "isN(-0.1)",             -> sai.isN(-0.1).should.be.false
   test "isN(2e64)",             -> sai.isN(2e64).should.be.true
   test "isN(0b10)",             -> sai.isN(0b10).should.be.true
   test "isN(0o36)",             -> sai.isN(0o36).should.be.true
   test "isN(0xFA)",             -> sai.isN(0xFA).should.be.true
   test "isN(new Number(1))",    -> sai.isN(new Number(1)).should.be.true
   test "isN(Number.MIN_VALUE)", -> sai.isN(Number.MIN_VALUE).should.be.false
   test "isN(Number.MAX_VALUE)", -> sai.isN(Number.MAX_VALUE).should.be.true

   test "isN('1')",              -> sai.isN('1').should.be.false
   test "isN(10/0)",             -> sai.isN(10/0).should.be.false
   test "isN(NaN)",              -> sai.isN(NaN).should.be.false
   test "isN(Infinity)",         -> sai.isN(Infinity).should.be.false
   test "isN(-Infinity)",        -> sai.isN(-Infinity).should.be.false