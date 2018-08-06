suite "year", ->

   test "year(date)", -> sai.year(new Date(2018, 3, 12, 6, 15, 45, 666)).should.eql(2018)