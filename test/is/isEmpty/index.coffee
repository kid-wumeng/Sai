suite "isEmpty", ->

   test "isEmpty({})",            -> sai.isEmpty({}).should.be.true
   test "isEmpty([])",            -> sai.isEmpty([]).should.be.true
   test "isEmpty('')",            -> sai.isEmpty('').should.be.true

   test "isEmpty({name: 'sai'})", -> sai.isEmpty({name: 'sai'}).should.be.false
   test "isEmpty([1])",           -> sai.isEmpty([1]).should.be.false
   test "isEmpty('1')",           -> sai.isEmpty('1').should.be.false

   test "isEmpty(null)",          -> sai.isEmpty(null).should.be.true
   test "isEmpty(undefined)",     -> sai.isEmpty(undefined).should.be.true
   test "isEmpty(true)",          -> sai.isEmpty(true).should.be.true
   test "isEmpty(1)",             -> sai.isEmpty(1).should.be.true
   test "isEmpty(Symbol())",      -> sai.isEmpty(Symbol()).should.be.true