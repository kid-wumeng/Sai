suite "max", ->

   test "max(1.2, 2.4, 3.6)", -> sai.max(1.2, 2.4, 3.6).should.eql(3.6)
   test "max(-1.2, 2.4, -3.6)", -> sai.max(-1.2, 2.4, -3.6).should.eql(2.4)
   test "max(-1.2, -2.4, -3.6)", -> sai.max(-1.2, -2.4, -3.6).should.eql(-1.2)