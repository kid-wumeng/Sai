suite "Tester@is", ->

   test "test(null)", -> (-> sai.test(null).is(String)).should.not.throw()
   test "test('1')",  -> (-> sai.test('1').is(String)).should.not.throw()
   test "test(1)",    -> (-> sai.test(1).is(String)).should.throw()
