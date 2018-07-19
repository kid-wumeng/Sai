suite "last", ->

   test "last([1, 2, 3])", -> expect(sai.last([1, 2, 3])).equal(3)
   test "last('123')",     -> expect(sai.last('123')).equal('3')
   test "last(123)",       -> expect(sai.last(123)).be.undefined
   test "last([])",        -> expect(sai.last([])).be.undefined
   test "last(undefined)", -> expect(sai.last(undefined)).be.undefined