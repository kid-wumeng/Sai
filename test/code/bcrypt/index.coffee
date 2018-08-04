suite "bcrypt", ->

   test "bcrypt", ->

      salt   = await sai.bcrypt.salt(10)
      hash   = await sai.bcrypt.hash('12345678', salt)
      result = await sai.bcrypt.compare('12345678', hash)

      result.should.be.true