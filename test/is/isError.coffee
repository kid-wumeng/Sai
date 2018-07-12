suite "isError", ->

   try
      throw new Error("an error !")
   catch error1
      test "isError(error1)", -> sai.isError(error1).should.be.true

   try
      throw "an error !"
   catch error2
      test "isError(error2)", -> sai.isError(error2).should.be.false