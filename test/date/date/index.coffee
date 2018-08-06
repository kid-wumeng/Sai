suite "date", ->

   test "date(2018, 3, 12, 6, 15, 45, 666)", ->

      date = sai.date(2018, 3, 12, 6, 15, 45, 666)

      date.should.be.instanceof(Date)
      date.getFullYear().should.eql(2018)
      date.getMonth().should.eql(2)
      date.getDate().should.eql(12)
      date.getHours().should.eql(6)
      date.getMinutes().should.eql(15)
      date.getSeconds().should.eql(45)
      date.getMilliseconds().should.eql(666)