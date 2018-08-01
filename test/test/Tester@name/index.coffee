suite "Tester@name", ->

   test "name('abc')", -> sai.test({}).name('abc').name().should.equal('abc')
   test "name(true)",  -> (-> sai.test({}).name(true)).should.throw()