suite "Tester@plainObject", ->

   test "test({})",   -> (-> sai.test({}).plainObject()).should.not.throw()
   test "test(null)", -> (-> sai.test(null).plainObject()).should.not.throw()
   test "test([])",   -> (-> sai.test([]).plainObject()).should.throw()
