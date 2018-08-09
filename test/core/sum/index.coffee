suite "sum", ->


   test "sum([1, 2.4, '100', -3.6])", ->
      sai.sum([1, 2.4, '100', -3.6]).should.eql(-0.2)


   test "sum(set)", ->
      set = new Set
      set.add(1)
      set.add(2)
      set.add(3)
      sai.sum(set).should.eql(6)


   test "sum(map)", ->
      map = new Map
      map.set('a', 1)
      map.set('b', 2)
      map.set('c', 3)
      sai.sum(map).should.eql(6)


   test "sum({a, b, c, d})", ->
      data =
         a: 1
         b: 2.4
         c: '100'
         d: -3.6
      sai.sum(data).should.eql(-0.2)