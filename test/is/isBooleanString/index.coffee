suite "isBooleanString", ->

   test "isBooleanString('true')",  -> sai.isBooleanString('true').should.be.true
   test "isBooleanString('false')", -> sai.isBooleanString('false').should.be.true

   test "isBooleanString(true)",    -> sai.isBooleanString(true).should.be.false
   test "isBooleanString(false)",   -> sai.isBooleanString(false).should.be.false