suite "Switcher", ->

   test "new Switcher()",   -> (-> new sai.Switcher()).should.throw()
   test "new Switcher({})", -> (-> new sai.Switcher({})).should.throw()