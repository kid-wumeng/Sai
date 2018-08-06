suite "Duration", ->

   from = new Date(2016, 3, 15, 12, 35, 8, 789)
   to   = new Date(2018, 5, 12, 6, 15, 45, 666)

   duration = new sai.Duration(from, to)

   test "allYears()",        -> duration.allYears().should.eql(2)
   test "allYears(true)",    -> duration.allYears(true).toFixed(2).should.eql('2.16')

   test "allMonths()",       -> duration.allMonths().should.eql(25)
   test "allMonths(true)",   -> duration.allMonths(true).toFixed(2).should.eql('25.89')

   test "allDays()",         -> duration.allDays().should.eql(787)
   test "allDays(true)",     -> duration.allDays(true).toFixed(2).should.eql('787.74')

   test "allHours()",        -> duration.allHours().should.eql(18905)
   test "allHours(true)",    -> duration.allHours(true).toFixed(2).should.eql('18905.68')

   test "allMinutes()",      -> duration.allMinutes().should.eql(1134340)
   test "allMinutes(true)",  -> duration.allMinutes(true).toFixed(2).should.eql('1134340.61')

   test "allSeconds()",      -> duration.allSeconds().should.eql(68060436)
   test "allSeconds(true)",  -> duration.allSeconds(true).toFixed(2).should.eql('68060436.88')

   test "allMilliSeconds()", -> duration.allMilliSeconds().should.eql(68060436877)

   # test "milliSeconds",    -> duration.milliSeconds().should.eql(877)
   # test "seconds",         -> duration.seconds().should.eql(36)
   # test "minutes",         -> duration.minutes().should.eql(40)
   # test "hours",           -> duration.hours().should.eql(17)