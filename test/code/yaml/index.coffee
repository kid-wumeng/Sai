suite "yaml", ->

   test "yaml", ->

      text = await sai.yaml.stringify({
         user:
            name: 'kid'
            age: 18
      })

      sai.yaml.parse(text).should.eql({
         user:
            name: 'kid'
            age: 18
      })