suite "getter&setter", ->

   date = -> new Date(2018, 3, 12, 6, 15, 45, 666)

   test "year(date)",        -> sai.year(date()).should.eql(2018)
   test "month(date)",       -> sai.month(date()).should.eql(4)
   test "minute(date)",      -> sai.minute(date()).should.eql(15)
   test "day(date)",         -> sai.day(date()).should.eql(12)
   test "hour(date)",        -> sai.hour(date()).should.eql(6)
   test "second(date)",      -> sai.second(date()).should.eql(45)
   test "milliSecond(date)", -> sai.milliSecond(date()).should.eql(666)
   test "week(date)",        -> sai.week(date()).should.eql(4)
   test "time(date)",        -> sai.time(date()).should.eql(1523484945666)