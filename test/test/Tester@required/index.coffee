suite "Tester@required", ->

   test "test('abc')",     -> (-> sai.test('abc').required()).should.not.throw()
   test "test(undefined)", -> (-> sai.test(undefined).required()).should.throw()
   test "test(null)",      -> (-> sai.test(null).required()).should.throw()