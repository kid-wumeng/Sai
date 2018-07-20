suite "count", ->


   test "count([3, 1, 4, 1, 5, 9, 2, 6, 5, 4], callback)", ->
      count = sai.count [3, 1, 4, 1, 5, 9, 2, 6, 5, 4], (n, i) -> n > 3
      count.should.equal(6)


   test "count('aBcDe', callback)", ->
      count = sai.count 'aBcDe', (char, i) -> /^[A-Z]$/.test(char)
      count.should.equal(2)


   test "count(fruitPrices, callback)", ->
      fruitPrices =
         cherry: 1.5
         orange: 2.5
         banana: 3

      count = sai.count fruitPrices, (value, name) -> value > 1.2
      count.should.equal(3)


   test "count(set, callback)", ->
      set = new Set
      set.add('a')
      set.add('b')
      set.add('c')
      sai.count(set, (value) -> value is 'b').should.equal(1)


   test "count(map, callback)", ->
      map = new Map
      map.set('a', 1)
      map.set('b', 2)
      map.set('c', 3)
      sai.count(map, (value) -> value > 1).should.equal(2)


   test "count(123, -> true)", -> sai.count(123, -> true).should.equal(0)
   test "count('abc', 123)",   -> sai.count('abc', 123).should.equal(0)