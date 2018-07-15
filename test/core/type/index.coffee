suite "type", ->

   test "type(undefined)",           -> expect(sai.type(undefined)).equal(undefined)
   test "type(null)",                -> expect(sai.type(null)).equal(null)
   test "type(NaN)",                 -> expect(sai.type(NaN)).be.NaN
   test "type(Infinity)",            -> sai.type(Infinity).should.equal(Number)
   test "type(Object.create(null))", -> sai.type(Object.create(null)).should.equal(Object)

   test "type(true)",                -> sai.type(true).should.equal(Boolean)
   test "type(1)",                   -> sai.type(1).should.equal(Number)
   test "type('abc')",               -> sai.type('abc').should.equal(String)
   test "type(Symbol())",            -> sai.type(Symbol()).should.equal(Symbol)

   test "type(new Boolean(true))",   -> sai.type(new Boolean(true)).should.equal(Boolean)
   test "type(new Number(1))",       -> sai.type(new Number(1)).should.equal(Number)
   test "type(new String('abc'))",   -> sai.type(new String('abc')).should.equal(String)

   test "type(=>)",                  -> sai.type(=>).should.equal(Function)
   test "type(=> await (=>))",       -> sai.type(=> await (=>)).should.equal(Function)

   test "type({})",                  -> sai.type({}).should.equal(Object)
   test "type([])",                  -> sai.type([]).should.equal(Array)
   test "type(new Date)",            -> sai.type(new Date).should.equal(Date)
   test "type(new Buffer('abc'))",   -> sai.type(new Buffer('abc')).should.equal(Buffer)

   test "type(class Sai)",           -> sai.type(class Sai).should.equal(Function)
   test "type(String)",              -> sai.type(String).should.equal(Function)
   test "type(Buffer)",              -> sai.type(Buffer).should.equal(Function)
   test "type(Object)",              -> sai.type(Object).should.equal(Function)
   test "type(Function)",            -> sai.type(Function).should.equal(Function)


   class Animal
   class Monkey extends Animal
   class Person extends Monkey

   test "type(new Person)", -> sai.type(new Person).should.equal(Person)