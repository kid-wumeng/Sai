suite "day", ->

   test "day(date)", -> sai.day(new Date(2018, 3, 12, 6, 15, 45, 666)).should.eql(12)