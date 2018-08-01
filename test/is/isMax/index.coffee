suite "isMax", ->

   test "isMax(2, 1)",                -> sai.isMax(2, 1).should.be.false
   test "isMax(2, 2)",                -> sai.isMax(2, 2).should.be.true
   test "isMax(2, 3)",                -> sai.isMax(2, 3).should.be.true
   test "isMax('ab', 1)",             -> sai.isMax('ab', 1).should.be.false
   test "isMax('ab', 2)",             -> sai.isMax('ab', 2).should.be.true
   test "isMax('ab', 3)",             -> sai.isMax('ab', 3).should.be.true
   test "isMax(new Buffer('ab'), 1)", -> sai.isMax(new Buffer('ab'), 1).should.be.false
   test "isMax(new Buffer('ab'), 2)", -> sai.isMax(new Buffer('ab'), 2).should.be.true
   test "isMax(new Buffer('ab'), 3)", -> sai.isMax(new Buffer('ab'), 3).should.be.true