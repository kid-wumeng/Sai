suite "Switcher@case", ->

   test "case(Class)", -> sai.switch(['abc']).case(String).then(true).result().should.be.true
   test "case(check)", -> sai.switch(['abc']).case(sai.isString).then(true).result().should.be.true
   test "case(value)", -> sai.switch(['abc']).case('abc').then(true).result().should.be.true



   param = 'a': 'b': 'c'
   data1 = 'a': 'b': 'c'
   data2 = 'a': 'b': 'd'
   data3 = 'a': {}
   data4 = 'a': {'b': 'c', 'd': 'e'}

   test "case(data1)", -> expect(sai.switch([data1]).case(param).then(true).result()).be.true
   test "case(data2)", -> expect(sai.switch([data2]).case(param).then(true).result()).be.undefined
   test "case(data3)", -> expect(sai.switch([data3]).case(param).then(true).result()).be.undefined
   test "case(data4)", -> expect(sai.switch([data4]).case(param).then(true).result()).be.undefined



   test "case(arguments)", ->

      func = ->
         return sai.switch(arguments)
         .case(String, sai.isString, { name: 'abc' }).then('case 1')
         .case(String, sai.isNumber, { name: 'abc' }).then('case 2')
         .case(String, sai.isNumber, { name: '123' }).then('case 3')
         .result()

      func('abc', 123, { name: 'abc' }).should.equal('case 2')



   test "case(Boolean).case(Number).case(String)", ->

      func = ->
         return sai.switch(arguments)
         .case(1)
         .case(2)
         .case(3).then('success')
         .result()

      func(2).should.equal('success')