suite "isEqual", ->

   test "isEqual(undefined, undefined)",                         -> sai.isEqual(undefined, undefined).should.be.true
   test "isEqual(null, null)",                                   -> sai.isEqual(null, null).should.be.true
   test "isEqual(true, true)",                                   -> sai.isEqual(NaN, NaN).should.be.true
   test "isEqual(1, 1)",                                         -> sai.isEqual(1, 1).should.be.true
   test "isEqual('abc', 'abc')",                                 -> sai.isEqual('abc', 'abc').should.be.true
   test "isEqual({'a': {'b': ['c']}}, {'a': {'b': ['c']}})",     -> sai.isEqual({'a': {'b': ['c']}}, {'a': {'b': ['c']}}).should.be.true
   test "isEqual(['a', 'b', 'c'], ['a', 'b', 'c'])",             -> sai.isEqual(['a', 'b', 'c'], ['a', 'b', 'c']).should.be.true
   test "isEqual(new Date(2018, 6, 14), new Date(2018, 6, 14))", -> sai.isEqual(new Date(2018, 6, 14), new Date(2018, 6, 14)).should.be.true
   test "isEqual(NaN, NaN)",                                     -> sai.isEqual(NaN, NaN).should.be.true


   test "isEqual(true, new Boolean(true))",  -> sai.isEqual(true, new Boolean(true)).should.be.true
   test "isEqual(1, new Number(1))",         -> sai.isEqual(1, new Number(1)).should.be.true
   test "isEqual('abc', new String('abc'))", -> sai.isEqual('abc', new String('abc')).should.be.true


   test "isEqual(undefined, null)",              -> sai.isEqual(undefined, null).should.be.false
   test "isEqual(1, '1')",                       -> sai.isEqual(1, '1').should.be.false
   test "isEqual(->, ->)",                       -> sai.isEqual(->, ->).should.be.false
   test "isEqual(Symbol('abc'), Symbol('abc'))", -> sai.isEqual(Symbol('abc'), Symbol('abc')).should.be.false
   test "isEqual({'0': 'abc'}, ['abc'])",        -> sai.isEqual({'0': 'abc'}, ['abc']).should.be.false


   abcSymbol = Symbol('abc')
   test "isEqual(abcSymbol, abcSymbol)", -> sai.isEqual(abcSymbol, abcSymbol).should.be.true