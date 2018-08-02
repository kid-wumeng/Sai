suite "Tester@boolean", ->

   test "test(null)", -> (-> sai.test(null).boolean()).should.not.throw()
   test "test(true)", -> (-> sai.test(true).boolean()).should.not.throw()
   test "test(1234)", -> (-> sai.test(1234).boolean()).should.throw()