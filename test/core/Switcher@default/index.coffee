suite "Switcher@default", ->


   class Animal

      constructor: ->
         @abc = 'abc'

      sleep: ->
         await sai.sleep(1)
         return @abc

      speak1: -> await sai.switch(arguments, @).case().then().default('abc').result()
      speak2: -> await sai.switch(arguments, @).case().then().default(-> 'abc').result()
      speak3: -> await sai.switch(arguments, @).case().then().default(-> @abc).result()
      speak4: -> await sai.switch(arguments, @).case().then().default(@sleep).result()
      speak5: -> await sai.switch(arguments, @).case().then().default(-> throw 'abc').result()


   animal = new Animal()


   test "default(1)", -> (await animal.speak1(true)).should.equal('abc')
   test "default(2)", -> (await animal.speak2(true)).should.equal('abc')
   test "default(3)", -> (await animal.speak3(true)).should.equal('abc')
   test "default(4)", -> (await animal.speak4(true)).should.equal('abc')
   test "default(5)", ->
      try
         await animal.speak5(true)
      catch error
         error.should.equal('abc')