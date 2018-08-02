suite "Tester@min", ->

   test "test(null)", -> (-> sai.test(null).min(2)).should.not.throw()
   test "test(1)",    -> (-> sai.test(1).min(2)).should.throw()
   test "test(2)",    -> (-> sai.test(2).min(2)).should.not.throw()
   test "test(3)",    -> (-> sai.test(3).min(2)).should.not.throw()