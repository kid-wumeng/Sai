suite "min", ->

   test "min(1.2, 2.4, 3.6)", -> sai.min(1.2, 2.4, 3.6).should.eql(1.2)
   test "min(1.2, -2.4, 3.6)", -> sai.min(1.2, -2.4, 3.6).should.eql(-2.4)
   test "min(-1.2, -2.4, -3.6)", -> sai.min(-1.2, -2.4, -3.6).should.eql(-3.6)