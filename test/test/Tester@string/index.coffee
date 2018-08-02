suite "Tester@string", ->

   test "test('1')",             -> (-> sai.test('1').string()).should.not.throw()
   test "test(null)",            -> (-> sai.test(null).string()).should.not.throw()
   test "test(new Buffer('1'))", -> (-> sai.test(new Buffer('1')).string()).should.throw()