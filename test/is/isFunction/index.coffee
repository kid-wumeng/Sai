suite "isFunction", ->

   test "isFunction((=>))",            -> sai.isFunction((=>)).should.be.true
   test "isFunction((=> await (=>)))", -> sai.isFunction((=> await (=>))).should.be.true

   test "isFunction(class)",           -> sai.isFunction(class).should.be.true
   test "isFunction(String)",          -> sai.isFunction(String).should.be.true
   test "isFunction(Object)",          -> sai.isFunction(Object).should.be.true
   test "isFunction(Function)",        -> sai.isFunction(Function).should.be.true