suite "isNaN", ->

   test "isNaN(NaN)",             -> sai.isNaN(NaN).should.be.true
   test "isNaN(new Number(NaN))", -> sai.isNaN(new Number(NaN)).should.be.true

   test "isNaN(undefined)",       -> sai.isNaN(undefined).should.be.false
   test "isNaN(null)",            -> sai.isNaN(null).should.be.false
   test "isNaN(123)",             -> sai.isNaN(123).should.be.false
   test "isNaN('abc')",           -> sai.isNaN('abc').should.be.false