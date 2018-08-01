suite "isMin", ->

   test "isMin(2, 1)",                -> sai.isMin(2, 1).should.be.true
   test "isMin(2, 2)",                -> sai.isMin(2, 2).should.be.true
   test "isMin(2, 3)",                -> sai.isMin(2, 3).should.be.false
   test "isMin('ab', 1)",             -> sai.isMin('ab', 1).should.be.true
   test "isMin('ab', 2)",             -> sai.isMin('ab', 2).should.be.true
   test "isMin('ab', 3)",             -> sai.isMin('ab', 3).should.be.false
   test "isMin(new Buffer('ab'), 1)", -> sai.isMin(new Buffer('ab'), 1).should.be.true
   test "isMin(new Buffer('ab'), 2)", -> sai.isMin(new Buffer('ab'), 2).should.be.true
   test "isMin(new Buffer('ab'), 3)", -> sai.isMin(new Buffer('ab'), 3).should.be.false