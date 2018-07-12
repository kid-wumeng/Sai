suite "isBoolean", ->

   test "isBoolean(true)",               -> sai.isBoolean(true).should.be.true
   test "isBoolean(false)",              -> sai.isBoolean(false).should.be.true
   test "isBoolean(new Boolean(true))",  -> sai.isBoolean(new Boolean(true)).should.be.true
   test "isBoolean(new Boolean(false))", -> sai.isBoolean(new Boolean(false)).should.be.true

   test "isBoolean(undefined)",          -> sai.isBoolean(undefined).should.be.false
   test "isBoolean(null)",               -> sai.isBoolean(null).should.be.false
   test "isBoolean(1)",                  -> sai.isBoolean(1).should.be.false
   test "isBoolean('true')",             -> sai.isBoolean('true').should.be.false