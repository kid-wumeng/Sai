suite "Tester@in", ->

   test "test(null)", -> (-> sai.test(null).in(['a', 1, true])).should.not.throw()
   test "test('a')",  -> (-> sai.test('a').in(['a', 1, true])).should.not.throw()
   test "test('b')",  -> (-> sai.test('b').in(['a', 1, true])).should.throw()