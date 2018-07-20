suite "isURL", ->

   test "isURL('https://google.com')", -> sai.isURL('https://google.com').should.be.true
   test "isURL('abc')",                -> sai.isURL('abc').should.be.false