suite "Tester@number", ->

   test "test(null)", -> (-> sai.test(null).number()).should.not.throw()
   test "test(1)",    -> (-> sai.test(1).number()).should.not.throw()
   test "test('1')",  -> (-> sai.test('1').number()).should.throw()