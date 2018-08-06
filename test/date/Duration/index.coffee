suite "Duration", ->

   from = new Date(2016, 3, 15, 12, 35, 8, 789)
   to   = new Date(2018, 5, 12, 6, 15, 45, 666)

   duration = new sai.Duration(from, to)

   test "allMilliSeconds", -> duration.allMilliSeconds().should.eql(68060436877)
   test "allSeconds",      -> duration.allSeconds().should.eql(68060437)
   test "allMinutes",      -> duration.allMinutes().should.eql(1134341)
   test "allHours",        -> duration.allHours().should.eql(18906)
   test "allDays",         -> duration.allDays().should.eql(788)
   test "allMonths",       -> duration.allMonths().should.eql(26)
   test "allYears",        -> duration.allYears().should.eql(3)