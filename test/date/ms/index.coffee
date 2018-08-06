suite "ms", ->

   test "ms(number)", -> sai.ms(5 * 24 * 60 * 60 * 1000).should.eql('5 days')
   test "ms(string)", -> sai.ms('5 days').should.eql(5 * 24 * 60 * 60 * 1000)