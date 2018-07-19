suite "concat", ->

   test "func([3, 4], null)", ->

      func = ->
         return sai.concat([1, true], 2, 'abc', undefined, new Date(2018), arguments)

      func([3, 4], null).should.eql([1, true, 2, 'abc', undefined, new Date(2018), [3, 4], null])