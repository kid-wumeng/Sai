suite "Tester@format", ->

   test "test(null)",            -> (-> sai.test(null).format('email')).should.not.throw()
   test "test('sai@gmail.com')", -> (-> sai.test('sai@gmail.com').format('email')).should.not.throw()
   test "test('sai#gmail.com')", -> (-> sai.test('sai#gmail.com').format('email')).should.throw()