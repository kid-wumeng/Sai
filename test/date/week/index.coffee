suite "week", ->

   test "week(date)", -> sai.week(new Date(2018, 3, 12, 6, 15, 45, 666)).should.eql(4)