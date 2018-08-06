suite "minute", ->

   test "minute(date)", -> sai.minute(new Date(2018, 3, 12, 6, 15, 45, 666)).should.eql(15)