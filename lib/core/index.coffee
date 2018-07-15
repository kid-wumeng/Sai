module.exports =

   # → Common
   type:  require('./type')
   equal: require('./equal')

   # → Object
   get: require('./get')

   # → Array-like
   index: require('./index_')

   # → String
   match: require('./match')

   # → Function
   switch:   require('./switch')
   Switcher: require('./Switcher')

   # → Others
   error: require('./error')
   sleep: require('./sleep')
   noop:  require('./noop')