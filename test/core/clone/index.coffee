suite "clone", ->

   test "clone(undefined)",   -> expect(sai.clone(undefined)).be.undefined
   test "clone(null)",        -> expect(sai.clone(null)).be.null
   test "clone(true)",        -> sai.clone(true).should.eql(true)
   test "clone(1)",           -> sai.clone(1).should.eql(1)
   test "clone('123')",       -> sai.clone('123').should.eql('123')
   test "clone([1, 2, 3])",   -> sai.clone([1, 2, 3]).should.eql([1, 2, 3])
   test "clone({a: b: [1]})", -> sai.clone({a: b: [1]}).should.eql({a: b: [1]})