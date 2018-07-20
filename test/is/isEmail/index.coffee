suite "isEmail", ->

   test "isEmail('sai@gmail.com')", -> sai.isEmail('sai@gmail.com').should.be.true
   test "isEmail('sai#gmail.com')", -> sai.isEmail('sai#gmail.com').should.be.false