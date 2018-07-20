suite "has", ->

   data =
      a:
         b: ['item1', 'item2']
         c: false
         d: null
         e: undefined

   test "has(data, 'a.b.0')",  -> sai.has(data, 'a.b.0').should.be.true
   test "has(data, 'a.b[0]')", -> sai.has(data, 'a.b[0]').should.be.true

   test "has(data, 'a.c')",    -> sai.has(data, 'a.c').should.be.true
   test "has(data, 'a.d')",    -> sai.has(data, 'a.d').should.be.true
   test "has(data, 'a.e')",    -> sai.has(data, 'a.e').should.be.true
   test "has(data, 'a.f')",    -> sai.has(data, 'a.f').should.be.false

   test "has(12345, '0')",     -> sai.has(12345, '0').should.be.false
   test "has('12345', 0)",     -> sai.has('12345', 0).should.be.false