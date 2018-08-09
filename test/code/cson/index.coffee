suite "cson", ->

   test "cson", ->

      text = await sai.cson.stringify({
         user:
            name: 'kid'
            age: 18
      })

      sai.cson.parse(text).should.eql({
         user:
            name: 'kid'
            age: 18
      })