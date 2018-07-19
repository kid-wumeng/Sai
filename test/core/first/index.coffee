suite "first", ->

   test "first('123')",     -> expect(sai.first('123')).equal('1')
   test "first([1, 2, 3])", -> expect(sai.first([1, 2, 3])).equal(1)
   test "first(123)",       -> expect(sai.first(123)).be.undefined
   test "first([])",        -> expect(sai.first([])).be.undefined