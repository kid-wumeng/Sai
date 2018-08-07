suite "formatDate", ->

   date = new Date(2018, 3, 12, 6, 15, 45, 666)

   test "formatDate(date, 'yyyy-mm-dd hh:ii:ss')", -> sai.formatDate(date, 'yyyy-mm-dd hh:ii:ss').should.eql('2018-4-12 6:15:45')
   test "formatDate(date, 'YYYY-MM-DD HH:II:SS')", -> sai.formatDate(date, 'YYYY-MM-DD HH:II:SS').should.eql('2018-04-12 06:15:45')