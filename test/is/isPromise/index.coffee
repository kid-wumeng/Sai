suite "isPromise", ->

   p1 = new Promise(=>)
   p2 = new Promise(=>)
   pp = Promise.all([ p1, p2 ])

   test "isPromise(p1)", -> sai.isPromise(p1).should.be.true
   test "isPromise(p2)", -> sai.isPromise(p2).should.be.true
   test "isPromise(pp)", -> sai.isPromise(pp).should.be.true