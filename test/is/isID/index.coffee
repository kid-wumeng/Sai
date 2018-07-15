suite "isID", ->

   test "isID(1)",                -> sai.isID(1).should.be.true
   test "isID(0)",                -> sai.isID(0).should.be.false
   test "isID(-1)",               -> sai.isID(-1).should.be.false
   test "isID(+0.1)",             -> sai.isID(+0.1).should.be.false
   test "isID(-0.1)",             -> sai.isID(-0.1).should.be.false
   test "isID(2e64)",             -> sai.isID(2e64).should.be.true
   test "isID(0b10)",             -> sai.isID(0b10).should.be.true
   test "isID(0o36)",             -> sai.isID(0o36).should.be.true
   test "isID(0xFA)",             -> sai.isID(0xFA).should.be.true
   test "isID(new Number(1))",    -> sai.isID(new Number(1)).should.be.true
   test "isID(Number.MIN_VALUE)", -> sai.isID(Number.MIN_VALUE).should.be.false
   test "isID(Number.MAX_VALUE)", -> sai.isID(Number.MAX_VALUE).should.be.true

   test "isID('1')",              -> sai.isID('1').should.be.false
   test "isID(10/0)",             -> sai.isID(10/0).should.be.false
   test "isID(NaN)",              -> sai.isID(NaN).should.be.false
   test "isID(Infinity)",         -> sai.isID(Infinity).should.be.false
   test "isID(-Infinity)",        -> sai.isID(-Infinity).should.be.false