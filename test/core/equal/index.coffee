suite "equal", ->

   test "equal(undefined, undefined)",                         -> sai.equal(undefined, undefined).should.be.true
   test "equal(null, null)",                                   -> sai.equal(null, null).should.be.true
   test "equal(true, true)",                                   -> sai.equal(NaN, NaN).should.be.true
   test "equal(1, 1)",                                         -> sai.equal(1, 1).should.be.true
   test "equal('abc', 'abc')",                                 -> sai.equal('abc', 'abc').should.be.true
   test "equal({'a': {'b': ['c']}}, {'a': {'b': ['c']}})",     -> sai.equal({'a': {'b': ['c']}}, {'a': {'b': ['c']}}).should.be.true
   test "equal(['a', 'b', 'c'], ['a', 'b', 'c'])",             -> sai.equal(['a', 'b', 'c'], ['a', 'b', 'c']).should.be.true
   test "equal(new Date(2018, 6, 14), new Date(2018, 6, 14))", -> sai.equal(new Date(2018, 6, 14), new Date(2018, 6, 14)).should.be.true
   test "equal(NaN, NaN)",                                     -> sai.equal(NaN, NaN).should.be.true


   test "equal(true, new Boolean(true))",  -> sai.equal(true, new Boolean(true)).should.be.true
   test "equal(1, new Number(1))",         -> sai.equal(1, new Number(1)).should.be.true
   test "equal('abc', new String('abc'))", -> sai.equal('abc', new String('abc')).should.be.true


   test "equal(undefined, null)",              -> sai.equal(undefined, null).should.be.false
   test "equal(1, '1')",                       -> sai.equal(1, '1').should.be.false
   test "equal(->, ->)",                       -> sai.equal(->, ->).should.be.false
   test "equal(Symbol('abc'), Symbol('abc'))", -> sai.equal(Symbol('abc'), Symbol('abc')).should.be.false
   test "equal({'0': 'abc'}, ['abc'])",        -> sai.equal({'0': 'abc'}, ['abc']).should.be.false


   abcSymbol = Symbol('abc')
   test "equal(abcSymbol, abcSymbol)", -> sai.equal(abcSymbol, abcSymbol).should.be.true