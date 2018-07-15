suite "isSymbol", ->

   test "isSymbol(Symbol())", -> sai.isSymbol(Symbol()).should.be.true
   test "isSymbol(Symbol)",   -> sai.isSymbol(Symbol).should.be.false