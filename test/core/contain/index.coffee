suite "contain", ->

   test "contain('abc', 'ab')",   -> sai.contain('abc', 'ab').should.be.true
   test "contain('abc', 'ac')",   -> sai.contain('abc', 'ac').should.be.false
   test "contain('abc', 'abcd')", -> sai.contain('abc', 'abcd').should.be.false

   array = [{a: b: [1]}, 'abc', [1, 2, 3]]
   child = a: b: [1]

   test "contain(array, child)",     -> sai.contain(array, child).should.be.true
   test "contain(array, 'abc')",     -> sai.contain(array, 'abc').should.be.true
   test "contain(array, [1, 2, 3])", -> sai.contain(array, [1, 2, 3]).should.be.true
   test "contain(array, 123)",       -> sai.contain(array, 123).should.be.false