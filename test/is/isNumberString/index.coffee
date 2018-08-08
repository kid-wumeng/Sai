suite "isNumberString", ->

   test "isNumberString('1')",    -> sai.isNumberString('1').should.be.true
   test "isNumberString('1.2')",  -> sai.isNumberString('1.2').should.be.true
   test "isNumberString('-1.2')", -> sai.isNumberString('-1.2').should.be.true

   test "isNumberString(1)",      -> sai.isNumberString(1).should.be.false
   test "isNumberString(1.2)",    -> sai.isNumberString(1.2).should.be.false
   test "isNumberString(-1.2)",   -> sai.isNumberString(-1.2).should.be.false