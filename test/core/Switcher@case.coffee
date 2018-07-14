suite "Switcher@case", ->


   test "case(Class)", -> sai.switch(['abc']).case(String).then(true).result().should.be.true
   test "case(check)", -> sai.switch(['abc']).case(sai.isString).then(true).result().should.be.true
   test "case(value)", -> sai.switch(['abc']).case('abc').then(true).result().should.be.true


   # abc = ->
   #    return sai.switch(arguments)
   #       .case(Number, sai.isString, { name: 'abc' }).then('case 1')
   #       .case(Number, sai.isString, ).then('case 2')
   #       .result()
   #
   #
   # test "case(object)", -> abc(1, 'a').should.equal('case 1')
   # test "then(check)", -> abc(1, 'a').should.equal('case 2')