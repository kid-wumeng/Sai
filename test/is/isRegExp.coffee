suite "isRegExp", ->

   test "isRegExp(/^abc$/ig)",                 -> sai.isRegExp(/^abc$/ig).should.be.true
   test "isRegExp(new RegExp('^abc$', 'ig'))", -> sai.isRegExp(new RegExp('^abc$', 'ig')).should.be.true