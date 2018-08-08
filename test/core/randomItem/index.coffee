suite "randomItem", ->



   test "randomItem([])", ->
      expect(sai.randomItem([])).be.undefined



   test "randomItem(['a', 'b', 'c'])", ->

      array = ['a', 'b', 'c']
      item  = sai.randomItem(array)

      switch item
         when 'a' then array.should.eql(['a', 'b', 'c'])
         when 'b' then array.should.eql(['a', 'b', 'c'])
         when 'c' then array.should.eql(['a', 'b', 'c'])



   test "randomItem(['a', 'b', 'c'], isPop = true)", ->

      array = ['a', 'b', 'c']
      item  = sai.randomItem(array, isPop = true)

      switch item
         when 'a' then array.should.eql(['b', 'c'])
         when 'b' then array.should.eql(['a', 'c'])
         when 'c' then array.should.eql(['a', 'b'])