suite "isDate", ->

   test "isDate(new Date(2018, 6, 5))", -> sai.isDate(new Date(2018, 6, 5)).should.be.true
   test "isDate('2018-07-05')",         -> sai.isDate('2018-07-05').should.be.false