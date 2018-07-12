suite "isObject", ->

   test "isObject({})",                  -> sai.isObject({}).should.be.true
   test "isObject(new Object)",          -> sai.isObject(new Object).should.be.true
   test "isObject(Object.create(null))", -> sai.isObject(Object.create(null)).should.be.true
   
   test "isObject(Object.create({}))",   -> sai.isObject(Object.create({})).should.be.true
   test "isObject(Object)",              -> sai.isObject(Object).should.be.true
   test "isObject([])",                  -> sai.isObject([]).should.be.true
   test "isObject(=>)",                  -> sai.isObject(=>).should.be.true
   test "isObject(class)",               -> sai.isObject(class).should.be.true
   test "isObject(/^abc$/ig)",           -> sai.isObject(/^abc$/ig).should.be.true
   test "isObject(new Date)",            -> sai.isObject(new Date).should.be.true
   test "isObject(new Boolean(true))",   -> sai.isObject(new Boolean(true)).should.be.true
   test "isObject(new Number(1))",       -> sai.isObject(new Number(1)).should.be.true
   test "isObject(new String('abc'))",   -> sai.isObject(new String('abc')).should.be.true

   test "isObject(undefined)",           -> sai.isObject(undefined).should.be.false
   test "isObject(null)",                -> sai.isObject(null).should.be.false
   test "isObject(true)",                -> sai.isObject(true).should.be.false
   test "isObject(1)",                   -> sai.isObject(1).should.be.false
   test "isObject('abc')",               -> sai.isObject('abc').should.be.false