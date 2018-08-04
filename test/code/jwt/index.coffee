suite "jwt", ->

   test "jwt:valid", ->

      token  = sai.jwt.encode({ id: 1, name: 'kid' }, 'secret', 1000)
      data   = sai.jwt.decode(token)
      valid  = sai.jwt.verify(token, 'secret')

      data.should.be.an('object')
      data.id.should.eql(1)
      data.name.should.eql('kid')
      valid.should.be.true

   test "jwt:invalid", ->

      token  = sai.jwt.encode({ id: 1, name: 'kid' }, 'secret')
      data   = sai.jwt.decode(token)
      valid  = sai.jwt.verify(token, 'secret')

      data.should.be.an('object')
      data.id.should.eql(1)
      data.name.should.eql('kid')
      valid.should.be.false