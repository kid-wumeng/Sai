suite "Switcher@then", ->


   class Animal

      constructor: ->
         @abc = 'abc'

      sleep: ->
         await sai.sleep(1)
         return @abc

      speak: ->
         return await sai.switch(arguments, @)
            .case(1).then('abc')
            .case(2).then(-> 'abc')
            .case(3).then(-> @abc)
            .case(4).then(@sleep)
            .case(5).then(-> throw 'abc')
            .result()


   animal = new Animal()


   test "then(1)", -> (await animal.speak(1)).should.equal('abc')
   test "then(2)", -> (await animal.speak(2)).should.equal('abc')
   test "then(3)", -> (await animal.speak(3)).should.equal('abc')
   test "then(4)", -> (await animal.speak(4)).should.equal('abc')
   test "then(5)", ->
      try
         await animal.speak(5)
      catch error
         error.should.equal('abc')