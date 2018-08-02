suite "Tester@array", ->

   test "test(null)", -> (-> sai.test(null).array()).should.not.throw()
   test "test([])",   -> (-> sai.test([]).array()).should.not.throw()
   test "test({})",   -> (-> sai.test({}).array()).should.throw()