suite.only "switch", ->

   test "switch(['a', 1, 'c', -2])", ->

      abc = ->
         sai.switch(arguments)
            .case(String, Number, 'c', sai.isID).then('case 1')
            .case(String, Number, 'c', sai.isNumber).then('case 2')
            .case(String, Number, 'd', sai.isNumber).then('case 3')
            .default('default')
            .result().should.equal('case 2')

      abc('a', 1, 'c', -2)




   test "switch(['a', 1, 'c'])", ->

      abc = ->
         sai.switch(arguments)
            .case(String, Number, 'c', sai.isID).then('case 1')
            .case(String, Number, 'c', sai.isNumber).then('case 2')
            .case(String, Number, 'd', sai.isNumber).then('case 3')
            .default('default')
            .result().should.equal('default')

      abc('a', 1, 'c')




   test "switch(['a', 1, 'c', -2, 'e'])", ->

      abc = ->
         sai.switch(arguments)
            .case(String, Number, 'c', sai.isID).then('case 1')
            .case(String, Number, 'c', sai.isNumber).then('case 2')
            .case(String, Number, 'd', sai.isNumber).then('case 3')
            .default('default')
            .result().should.equal('default')

      abc('a', 1, 'c', -2, 'e')




   test "switch([0])", ->

      abc = ->
         sai.switch(arguments)
            .case(sai.isNil).then(-> 'case 1')
            .case(Number).then(-> 'case 2')
            .case(String).then(-> 'case 3')
            .default(-> 'default')
            .result().should.equal('case 2')

      abc(0)




   test "switch([true])", ->

      abc = ->
         sai.switch(arguments)
            .case(sai.isNil).then(-> 'case 1')
            .case(Number).then(-> 'case 2')
            .case(String).then(-> 'case 3')
            .default(-> 'default')
            .result().should.equal('default')

      abc(true)




   test "switch([Symbol()])", ->

      abc = ->
         result = sai.switch(arguments)
            .case(sai.isNil).then('case 1')
            .case(Number).then('case 2')
            .case(String).then('case 3')
            .result()

         expect(result).equal(undefined)

      abc(Symbol())




   test "switch([Symbol()]).default(throw)", ->

      abc = ->
         result = sai.switch(arguments)
            .case(sai.isNil).then('case 1')
            .case(Number).then('case 2')
            .case(String).then('case 3')
            .default(-> throw "this is an error !")
            .result()

      (-> abc(Symbol())).should.throw('this is an error !')