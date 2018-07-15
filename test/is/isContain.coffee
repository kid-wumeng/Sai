suite "isContain", ->

   test "isContain('abc', 'ab')",   -> sai.isContain('abc', 'ab').should.be.true
   test "isContain('abc', 'ac')",   -> sai.isContain('abc', 'ac').should.be.false
   test "isContain('abc', 'abcd')", -> sai.isContain('abc', 'abcd').should.be.false



   array = [{a: b: [1]}, 'abc', [1, 2, 3]]
   child = a: b: [1]

   test "isContain(array, child)",     -> sai.isContain(array, child).should.be.true
   test "isContain(array, 'abc')",     -> sai.isContain(array, 'abc').should.be.true
   test "isContain(array, [1, 2, 3])", -> sai.isContain(array, [1, 2, 3]).should.be.true
   test "isContain(array, 123)",       -> sai.isContain(array, 123).should.be.false



   object =
      a:
         b: '1'
         c: [2]

   child1 = a: {}
   child2 = a: c: [2]
   child3 = c: [2]

   test "isContain(object, child1)", -> sai.isContain(object, child1).should.be.true
   test "isContain(object, child2)", -> sai.isContain(object, child2).should.be.true
   test "isContain(object, child3)", -> sai.isContain(object, child3).should.be.false