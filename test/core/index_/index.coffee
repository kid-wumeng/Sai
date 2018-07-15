suite "index", ->

   test "index('abcde', 'ab')", -> sai.index('abcde', 'ab').should.equal(0)
   test "index('abcde', 'cd')", -> sai.index('abcde', 'cd').should.equal(2)
   test "index('abcde', 'ce')", -> sai.index('abcde', 'ce').should.equal(-1)

   test "index('ababa', 'ab')",    -> sai.index('ababa', 'ab').should.equal(0)
   test "index('ababa', 'ab', 1)", -> sai.index('ababa', 'ab', 1).should.equal(2)

   array = [{a: b: [1]}, 'abc', [1, 2, 3], 'abc']
   child = a: b: [1]

   test "index(array, child)",     -> sai.index(array, child).should.equal(0)
   test "index(array, 'abc')",     -> sai.index(array, 'abc').should.equal(1)
   test "index(array, 'abc', 2)",  -> sai.index(array, 'abc', 2).should.equal(3)
   test "index(array, [1, 2, 3])", -> sai.index(array, [1, 2, 3]).should.equal(2)
   test "index(array, 123)",       -> sai.index(array, 123).should.equal(-1)