suite "Tester@check", ->

   check = ( data ) =>
      return typeof(data) is 'number' and data > 2

   test "test(null)", -> (-> sai.test(null).check(check)).should.throw()
   test "test(1)",    -> (-> sai.test(1).check(check)).should.throw()
   test "test(3)",    -> (-> sai.test(3).check(check)).should.not.throw()