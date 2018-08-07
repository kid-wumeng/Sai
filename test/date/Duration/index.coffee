suite "Duration", ->

   from = new Date(2016, 3, 15, 12, 35, 8, 789)
   to   = new Date(2018, 5, 12, 6, 15, 45, 666)

   duration = sai.between(from, to)

   test "years()",        -> duration.years().should.eql(2)
   test "years(true)",    -> duration.years(true).toFixed(2).should.eql('2.16')

   test "months()",       -> duration.months().should.eql(25)
   test "months(true)",   -> duration.months(true).toFixed(2).should.eql('25.89')

   test "days()",         -> duration.days().should.eql(787)
   test "days(true)",     -> duration.days(true).toFixed(2).should.eql('787.74')

   test "hours()",        -> duration.hours().should.eql(18905)
   test "hours(true)",    -> duration.hours(true).toFixed(2).should.eql('18905.68')

   test "minutes()",      -> duration.minutes().should.eql(1134340)
   test "minutes(true)",  -> duration.minutes(true).toFixed(2).should.eql('1134340.61')

   test "seconds()",      -> duration.seconds().should.eql(68060436)
   test "seconds(true)",  -> duration.seconds(true).toFixed(2).should.eql('68060436.88')

   test "milliSeconds()", -> duration.milliSeconds().should.eql(68060436877)

   test "weeks()",      -> duration.weeks().should.eql(112)
   test "weeks(true)",  -> duration.weeks(true).toFixed(2).should.eql('112.53')

   test "yearsBit()",        -> duration.yearsBit().should.eql(2)
   test "monthsBit()",       -> duration.monthsBit().should.eql(1)
   test "daysBit()",         -> duration.daysBit().should.eql(7)
   test "hoursBit()",        -> duration.hoursBit().should.eql(17)
   test "minutesBit()",      -> duration.minutesBit().should.eql(40)
   test "secondsBit()",      -> duration.secondsBit().should.eql(36)
   test "milliSecondsBit()", -> duration.milliSecondsBit().should.eql(877)
   test "weeksBit()",        -> duration.weeksBit().should.eql(0)

   test "format('yyyy-mm-dd hh:ii:ss')",    -> duration.format('yyyy-mm-dd hh:ii:ss').should.eql('2-25-787 18905:1134340:68060436')
   test "formatBit('yyyy-mm-dd hh:ii:ss')", -> duration.formatBit('yyyy-mm-dd hh:ii:ss').should.eql('2-1-7 17:40:36')
   test "formatBit('YYYY-MM-DD HH:II:SS')", -> duration.formatBit('YYYY-MM-DD HH:II:SS').should.eql('0002-01-07 17:40:36')