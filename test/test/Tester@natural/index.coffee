suite "Tester@id", ->

   test "test(1)",    -> (-> sai.test(1).id()).should.not.throw()
   test "test(null)", -> (-> sai.test(null).id()).should.not.throw()
   test "test('1')",  -> (-> sai.test('1').id()).should.throw()
   test "test(1.2)",  -> (-> sai.test(1.2).id()).should.throw()
   test "test(-1)",   -> (-> sai.test(-1).id()).should.throw()