module.exports =

   # → Bcrypt
   bcrypt:
      salt:    require('./bcrypt.salt')
      hash:    require('./bcrypt.hash')
      compare: require('./bcrypt.compare')

   # → JSON Web Token
   jwt:
      encode: require('./jwt.encode')
      decode: require('./jwt.decode')
      verify: require('./jwt.verify')