suite.only "index", ->

   test "index('abcde', 'ab')", -> sai.index('abcde', 'ab').should.equal(0)
   test "index('abcde', 'cd')", -> sai.index('abcde', 'cd').should.equal(2)
   test "index('abcde', 'ce')", -> sai.index('abcde', 'ce').should.equal(-1)

   test "index('ababa', 'ab')",    -> sai.index('ababa', 'ab').should.equal(0)
   test "index('ababa', 'ab', 1)", -> sai.index('ababa', 'ab', 1).should.equal(2)

   array = [{a: b: [1]}, 'abc', [1, 2, 3]]