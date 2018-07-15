suite "isNumber", ->

   test "isNumber(1)",                -> sai.isNumber(1).should.be.true
   test "isNumber(0)",                -> sai.isNumber(0).should.be.true
   test "isNumber(-1)",               -> sai.isNumber(-1).should.be.true
   test "isNumber(+0.1)",             -> sai.isNumber(+0.1).should.be.true
   test "isNumber(-0.1)",             -> sai.isNumber(-0.1).should.be.true
   test "isNumber(2e64)",             -> sai.isNumber(2e64).should.be.true
   test "isNumber(0b10)",             -> sai.isNumber(0b10).should.be.true
   test "isNumber(0o36)",             -> sai.isNumber(0o36).should.be.true
   test "isNumber(0xFA)",             -> sai.isNumber(0xFA).should.be.true
   test "isNumber(new Number(1))",    -> sai.isNumber(new Number(1)).should.be.true
   test "isNumber(Number.MIN_VALUE)", -> sai.isNumber(Number.MIN_VALUE).should.be.true
   test "isNumber(Number.MAX_VALUE)", -> sai.isNumber(Number.MAX_VALUE).should.be.true

   test "isNumber('1')",              -> sai.isNumber('1').should.be.false
   test "isNumber(10/0)",             -> sai.isNumber(10/0).should.be.false
   test "isNumber(NaN)",              -> sai.isNumber(NaN).should.be.false
   test "isNumber(Infinity)",         -> sai.isNumber(Infinity).should.be.false
   test "isNumber(-Infinity)",        -> sai.isNumber(-Infinity).should.be.false