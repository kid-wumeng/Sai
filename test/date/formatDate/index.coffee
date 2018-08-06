suite "formatDate", ->

   test "formatDate(date, format)", ->
      sai.formatDate(new Date(2018, 3, 12, 6, 15, 45, 666), 'YYYY-MM-DD HH:II:SS').should.eql('2018-04-12 06:15:45')