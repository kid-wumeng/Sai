suite "Tester@int", ->

   test "test(null)", -> (-> sai.test(null).int()).should.not.throw()
   test "test(1)",    -> (-> sai.test(1).int()).should.not.throw()
   test "test('1')",  -> (-> sai.test('1').int()).should.throw()
   test "test(1.2)",  -> (-> sai.test(1.2).int()).should.throw()
