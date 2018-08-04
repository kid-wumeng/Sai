module.exports =

   # → Bcrypt
   bcrypt:
      salt:    require('./bcrypt.salt')
      hash:    require('./bcrypt.hash')
      compare: require('./bcrypt.compare')