suite "deleteItem", ->

   test "deleteItem(array, i)", ->

      array = ['a', 'b', 'c']
      sai.deleteItem(array, 1)

      array.should.eql(['a', 'c'])