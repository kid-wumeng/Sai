suite "hour", ->

   test "hour(date)", -> sai.hour(new Date(2018, 3, 12, 6, 15, 45, 666)).should.eql(6)