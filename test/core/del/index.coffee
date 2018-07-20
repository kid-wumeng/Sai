suite "del", ->


   makeData = ->
      return
         a: b: ['item1', 'item2']


   test "del(data, 'a.b.0')", ->
      data = makeData()
      sai.del(data, 'a.b.0')
      expect(data.a.b[0]).be.undefined


   test "del(data, 'a.b[0]')", ->
      data = makeData()
      sai.del(data, 'a.b[0]')
      expect(data.a.b[0]).be.undefined


   test "del(data, 'a.b')", ->
      data = makeData()
      sai.del(data, 'a.b')
      data.a.should.eql({})