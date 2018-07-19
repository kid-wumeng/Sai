suite "len", ->

   test "len([1, 2, 3])",         -> sai.len([1, 2, 3]).should.equal(3)
   test "len('abc')",             -> sai.len('abc').should.equal(3)
   test "len('萌abc', 'length')", -> sai.len('萌abc', 'length').should.equal(4)
   test "len('萌abc', 'cjk')",    -> sai.len('萌abc', 'cjk').should.equal(5)



   test "len(set)", ->
      set = new Set
      set.add('a')
      set.add('b')
      set.add('c')
      sai.len(set).should.equal(3)

   test "len(map)", ->
      map = new Map
      map.set('a', 1)
      map.set('b', 2)
      map.set('c', 3)
      sai.len(map).should.equal(3)



   test "len(data)", ->

      data =
         name: 'kid'
         age: 18
         pets:
            name: 'mimi'
            type: 'cat'

      sai.len(data).should.equal(3)



   test "len(new Date)", ->
      sai.len(new Date).should.equal(0)



   test "len([1, '2', 3], callback)", ->

      len = sai.len [1, '2', 3], (item, i) ->
         if sai.isString(item)
            return 2
         else
            return 1

      len.should.equal(4)



   test "len('A BC', callback)", ->

      len = sai.len 'A BC', (char, i) ->
         if sai.isSpace(char)
            return 0
         else
            return 1

      len.should.equal(3)



   test "len(fruitPrices, callback)", ->

      fruitPrices =
         cherry: 1.5
         orange: 2.5
         banana: 3

      len = sai.len fruitPrices, (value, name) ->
         return value

      len.should.equal(7)



   test "len(undefined)", -> sai.len(undefined).should.equal(0)
   test "len(null)",      -> sai.len(null).should.equal(0)
   test "len(true)",      -> sai.len(true).should.equal(0)
   test "len(1)",         -> sai.len(1).should.equal(0)
   test "len(Symbol())",  -> sai.len(Symbol()).should.equal(0)