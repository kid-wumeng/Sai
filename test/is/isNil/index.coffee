suite "isNil", ->

   test "isNil(undefined)", -> sai.isNil(undefined).should.be.true
   test "isNil(null)",      -> sai.isNil(null).should.be.true

   test "isNil(false)",     -> sai.isNil(false).should.be.false
   test "isNil(0)",         -> sai.isNil(0).should.be.false
   test "isNil(NaN)",       -> sai.isNil(NaN).should.be.false
   test "isNil('')",        -> sai.isNil('').should.be.false