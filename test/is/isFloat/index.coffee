suite "isFloat", ->

   test "isFloat(1)",                -> sai.isFloat(1).should.be.false
   test "isFloat(0)",                -> sai.isFloat(0).should.be.false
   test "isFloat(-1)",               -> sai.isFloat(-1).should.be.false
   test "isFloat(+0.1)",             -> sai.isFloat(+0.1).should.be.true
   test "isFloat(-0.1)",             -> sai.isFloat(-0.1).should.be.true
   test "isFloat(2e64)",             -> sai.isFloat(2e64).should.be.false
   test "isFloat(0b10)",             -> sai.isFloat(0b10).should.be.false
   test "isFloat(0o36)",             -> sai.isFloat(0o36).should.be.false
   test "isFloat(0xFA)",             -> sai.isFloat(0xFA).should.be.false
   test "isFloat(new Number(1))",    -> sai.isFloat(new Number(1)).should.be.false
   test "isFloat(Number.MIN_VALUE)", -> sai.isFloat(Number.MIN_VALUE).should.be.true
   test "isFloat(Number.MAX_VALUE)", -> sai.isFloat(Number.MAX_VALUE).should.be.false

   test "isFloat('1')",              -> sai.isFloat('1').should.be.false
   test "isFloat(10/0)",             -> sai.isFloat(10/0).should.be.false
   test "isFloat(NaN)",              -> sai.isFloat(NaN).should.be.false
   test "isFloat(Infinity)",         -> sai.isFloat(Infinity).should.be.false
   test "isFloat(-Infinity)",        -> sai.isFloat(-Infinity).should.be.false