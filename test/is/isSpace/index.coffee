suite "isSpace", ->

   test "isSpace('')",    -> sai.isSpace('').should.be.true
   test "isSpace(' ')",   -> sai.isSpace(' ').should.be.true
   test "isSpace('  ')",  -> sai.isSpace('  ').should.be.true
   test "isSpace('　')",  -> sai.isSpace('　').should.be.true
   test "isSpace('\\t')", -> sai.isSpace('\t').should.be.true
   test "isSpace('\\r')", -> sai.isSpace('\r').should.be.true
   test "isSpace('\\n')", -> sai.isSpace('\n').should.be.true
   test "isSpace('abc')", -> sai.isSpace('abc').should.be.false