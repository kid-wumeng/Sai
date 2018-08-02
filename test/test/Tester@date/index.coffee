suite "Tester@date", ->

   test "test(new Date())", -> (-> sai.test(new Date()).date()).should.not.throw()
   test "test(null)",       -> (-> sai.test(null).date()).should.not.throw()