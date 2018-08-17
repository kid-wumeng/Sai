module.exports =

   # → CSON
   cson:
      stringify: require('./cson.stringify')
      parse:     require('./cson.parse')

   # → YAML
   yaml:
      stringify: require('./yaml.stringify')
      parse:     require('./yaml.parse')

   # → JSON Web Token
   jwt:
      encode: require('./jwt.encode')
      decode: require('./jwt.decode')
      verify: require('./jwt.verify')

   # → Bcrypt
   # bcrypt:
   #    salt:    require('./bcrypt.salt')
   #    hash:    require('./bcrypt.hash')
   #    compare: require('./bcrypt.compare')