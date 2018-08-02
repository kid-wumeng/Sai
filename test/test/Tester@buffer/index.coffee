suite "Tester@buffer", ->

   test "test(null)",            -> (-> sai.test(null).buffer()).should.not.throw()
   test "test(new Buffer('1'))", -> (-> sai.test(new Buffer('1')).buffer()).should.not.throw()
   test "test('1')",             -> (-> sai.test('1').buffer()).should.throw()