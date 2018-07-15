suite "isPlainObject", ->

   test "isPlainObject({})",                  -> sai.isPlainObject({}).should.be.true
   test "isPlainObject(new Object)",          -> sai.isPlainObject(new Object).should.be.true
   test "isPlainObject(Object.create(null))", -> sai.isPlainObject(Object.create(null)).should.be.true

   test "isPlainObject(Object.create({}))",   -> sai.isPlainObject(Object.create({})).should.be.false
   test "isPlainObject(Object)",              -> sai.isPlainObject(Object).should.be.false
   test "isPlainObject([])",                  -> sai.isPlainObject([]).should.be.false
   test "isPlainObject(=>)",                  -> sai.isPlainObject(=>).should.be.false
   test "isPlainObject(class)",               -> sai.isPlainObject(class).should.be.false
   test "isPlainObject(/^abc$/ig)",           -> sai.isPlainObject(/^abc$/ig).should.be.false
   test "isPlainObject(new Date)",            -> sai.isPlainObject(new Date).should.be.false
   test "isPlainObject(new Boolean(true))",   -> sai.isPlainObject(new Boolean(true)).should.be.false
   test "isPlainObject(new Number(1))",       -> sai.isPlainObject(new Number(1)).should.be.false
   test "isPlainObject(new String('abc'))",   -> sai.isPlainObject(new String('abc')).should.be.false

   test "isPlainObject(undefined)",           -> sai.isPlainObject(undefined).should.be.false
   test "isPlainObject(null)",                -> sai.isPlainObject(null).should.be.false
   test "isPlainObject(true)",                -> sai.isPlainObject(true).should.be.false
   test "isPlainObject(1)",                   -> sai.isPlainObject(1).should.be.false
   test "isPlainObject('abc')",               -> sai.isPlainObject('abc').should.be.false