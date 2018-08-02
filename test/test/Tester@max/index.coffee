suite "Tester@max", ->

   test "test(null)", -> (-> sai.test(null).max(2)).should.not.throw()
   test "test(1)",    -> (-> sai.test(1).max(2)).should.not.throw()
   test "test(2)",    -> (-> sai.test(2).max(2)).should.not.throw()
   test "test(3)",    -> (-> sai.test(3).max(2)).should.throw()