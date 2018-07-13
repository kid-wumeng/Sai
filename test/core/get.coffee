suite "get", ->

   data =
      a:
         b: ['item1', 'item2']
         c: null
         d: undefined

   test "get(data, 'a.b.0')",          -> expect(sai.get(data, 'a.b.0')).equal('item1')
   test "get(data, 'a.b[0]')",         -> expect(sai.get(data, 'a.b[0]')).equal('item1')

   test "get(data, 'a.c')",            -> expect(sai.get(data, 'a.c')).equal(null)
   test "get(data, 'a.c', 'default')", -> expect(sai.get(data, 'a.c', 'default')).equal(null)

   test "get(data, 'a.d')",            -> expect(sai.get(data, 'a.d')).equal(undefined)
   test "get(data, 'a.d', 'default')", -> expect(sai.get(data, 'a.d', 'default')).equal('default')

   test "get(data, 'a.e')",            -> expect(sai.get(data, 'a.e')).equal(undefined)
   test "get(data, 'a.e', 'default')", -> expect(sai.get(data, 'a.e', 'default')).equal('default')

   test "get(12345, '0')",             -> expect(sai.get(12345, '0')).equal(undefined)
   test "get(12345, '0', 'default')",  -> expect(sai.get(12345, '0', 'default')).equal('default')

   test "get('12345', 0)",             -> expect(sai.get('12345', 0)).equal(undefined)
   test "get('12345', 0, 'default')",  -> expect(sai.get('12345', 0, 'default')).equal('default')