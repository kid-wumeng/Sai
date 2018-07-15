suite "error", ->

   error1 = sai.error("this is an error !")

   test "error(message)",         -> error1.should.instanceof(Error)
   test "error(message).name",    -> error1.name.should.equal("Error")
   test "error(message).message", -> error1.message.should.equal("this is an error !")


   INVALID_PARAMS = Symbol()
   error2 = sai.error({ name: INVALID_PARAMS, message: "this is an error !" })

   test "error({ name, message })",         -> error2.should.instanceof(Error)
   test "error({ name, message }).name",    -> error2.name.should.equal(INVALID_PARAMS)
   test "error({ name, message }).message", -> error2.message.should.equal("this is an error !")