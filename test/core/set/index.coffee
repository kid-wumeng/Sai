suite "set", ->


   makeData = ->
      return
         a: b: ['item1', 'item2']


   test "set(data, 'a.b.0', 'kid')", ->
      data = makeData()
      sai.set(data, 'a.b.0', 'kid')
      data.a.b[0].should.equal('kid')


   test "set(data, 'a.b[0]', 'kid')", ->
      data = makeData()
      sai.set(data, 'a.b[0]', 'kid')
      data.a.b[0].should.equal('kid')


   test "set(data, 'a.c.d', 'kid')", ->
      data = makeData()
      sai.set(data, 'a.c.d', 'kid')
      data.a.c.d.should.equal('kid')