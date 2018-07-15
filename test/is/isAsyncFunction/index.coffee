suite "isAsyncFunction", ->

   test "isAsyncFunction((=>))",            -> sai.isAsyncFunction((=>)).should.be.false
   test "isAsyncFunction((=> await (=>)))", -> sai.isAsyncFunction((=> await (=>))).should.be.true

   test "isAsyncFunction(class)",           -> sai.isAsyncFunction(class).should.be.false
   test "isAsyncFunction(String)",          -> sai.isAsyncFunction(String).should.be.false
   test "isAsyncFunction(Object)",          -> sai.isAsyncFunction(Object).should.be.false
   test "isAsyncFunction(Function)",        -> sai.isAsyncFunction(Function).should.be.false