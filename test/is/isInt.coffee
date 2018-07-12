suite "isInt", ->

   test "isInt(1)",                -> sai.isInt(1).should.be.true
   test "isInt(0)",                -> sai.isInt(0).should.be.true
   test "isInt(-1)",               -> sai.isInt(-1).should.be.true
   test "isInt(+0.1)",             -> sai.isInt(+0.1).should.be.false
   test "isInt(-0.1)",             -> sai.isInt(-0.1).should.be.false
   test "isInt(2e64)",             -> sai.isInt(2e64).should.be.true
   test "isInt(0b10)",             -> sai.isInt(0b10).should.be.true
   test "isInt(0o36)",             -> sai.isInt(0o36).should.be.true
   test "isInt(0xFA)",             -> sai.isInt(0xFA).should.be.true
   test "isInt(new Number(1))",    -> sai.isInt(new Number(1)).should.be.true
   test "isInt(Number.MIN_VALUE)", -> sai.isInt(Number.MIN_VALUE).should.be.false
   test "isInt(Number.MAX_VALUE)", -> sai.isInt(Number.MAX_VALUE).should.be.true

   test "isInt('1')",              -> sai.isInt('1').should.be.false
   test "isInt(10/0)",             -> sai.isInt(10/0).should.be.false
   test "isInt(NaN)",              -> sai.isInt(NaN).should.be.false
   test "isInt(Infinity)",         -> sai.isInt(Infinity).should.be.false
   test "isInt(-Infinity)",        -> sai.isInt(-Infinity).should.be.false