suite "is", ->

   test "is(undefined, undefined)",        -> sai.is(undefined, undefined).should.be.true
   test "is(null, null)",                  -> sai.is(null, null).should.be.true
   test "is(NaN, NaN)",                    -> sai.is(NaN, NaN).should.be.true
   test "is(Infinity, Number)",            -> sai.is(Infinity, Number).should.be.true
   test "is(Object.create(null), Object)", -> sai.is(Object.create(null), Object).should.be.true

   test "is(true, Boolean)",               -> sai.is(true, Boolean).should.be.true
   test "is(1, Number)",                   -> sai.is(1, Number).should.be.true
   test "is('abc', String)",               -> sai.is('abc', String).should.be.true
   test "is(Symbol(), Symbol)",            -> sai.is(Symbol(), Symbol).should.be.true

   test "is(new Boolean(true), Boolean)",  -> sai.is(new Boolean(true), Boolean).should.be.true
   test "is(new Number(1), Number)",       -> sai.is(new Number(1), Number).should.be.true
   test "is(new String('abc'), String)",   -> sai.is(new String('abc'), String).should.be.true

   test "is((=>), Function)",              -> sai.is((=>), Function).should.be.true
   test "is((=> await (=>)), Function)",   -> sai.is((=> await (=>)), Function).should.be.true
   test "is((=>), Object)",                -> sai.is((=>), Object).should.be.true
   test "is((=> await (=>)), Object)",     -> sai.is((=> await (=>)), Object).should.be.true

   test "is({}, Object)",                  -> sai.is({}, Object).should.be.true
   test "is([], Array)",                   -> sai.is([], Array).should.be.true
   test "is(new Date, Date)",              -> sai.is(new Date, Date).should.be.true
   test "is(new Buffer('abc'), Buffer)",   -> sai.is(new Buffer('abc'), Buffer).should.be.true

   test "is(String, Function)",            -> sai.is(String, Function).should.be.true
   test "is(Object, Function)",            -> sai.is(Object, Function).should.be.true
   test "is(Function, Function)",          -> sai.is(Function, Function).should.be.true



   class Animal
   class Monkey extends Animal
   class Person extends Monkey

   test "is(new Person, Person)", -> sai.is(new Person, Person).should.be.true
   test "is(new Person, Monkey)", -> sai.is(new Person, Monkey).should.be.true
   test "is(new Person, Animal)", -> sai.is(new Person, Animal).should.be.true
   test "is(new Person, Object)", -> sai.is(new Person, Object).should.be.true



   test "is(new Boolean(true), Object)", -> sai.is(new Boolean(true), Object).should.be.true
   test "is(new Number(1), Object)",     -> sai.is(new Number(1), Object).should.be.true
   test "is(new String('abc'), Object)", -> sai.is(new String('abc'), Object).should.be.true

   test "is(String, Object)",            -> sai.is(String, Object).should.be.true
   test "is(Object, Object)",            -> sai.is(Object, Object).should.be.true
   test "is(Function, Object)",          -> sai.is(Function, Object).should.be.true



   test "is(true, Object)",              -> sai.is(true, Object).should.be.false
   test "is(1, Object)",                 -> sai.is(1, Object).should.be.false
   test "is('abc', Object)",             -> sai.is('abc', Object).should.be.false
   test "is(Symbol(), Object)",          -> sai.is(Symbol(), Object).should.be.false

   test "is(undefined, Object)",         -> sai.is(undefined, Object).should.be.false
   test "is(null, Object)",              -> sai.is(null, Object).should.be.false
   test "is(NaN, Object)",               -> sai.is(NaN, Object).should.be.false
   test "is(Infinity, Object)",          -> sai.is(Infinity, Object).should.be.false