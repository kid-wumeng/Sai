suite "month", ->

   test "month(date)", -> sai.month(new Date(2018, 3, 12, 6, 15, 45, 666)).should.eql(4)