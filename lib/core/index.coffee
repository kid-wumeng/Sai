module.exports =

   # → Common
   type:  require('./type')
   len:   require('./len')
   equal: require('./equal')
   clone: require('./clone')

   # → Number
   random: require('./random')

   # → Object
   has: require('./has')
   get: require('./get')
   set: require('./set')
   del: require('./del')

   # → Array-like
   index:   require('./index_')
   contain: require('./contain')
   first:   require('./first')
   last:    require('./last')
   concat:  require('./concat')

   # → String
   match: require('./match')

   # → Function
   switch:   require('./switch')
   Switcher: require('./Switcher')

   # → Others
   error: require('./error')
   sleep: require('./sleep')
   noop:  require('./noop')