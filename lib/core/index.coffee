module.exports =

   # → Base
   type:  require('./type')
   equal: require('./equal')
   clone: require('./clone')

   # → Number
   random: require('./random')

   # → Object
   len:   require('./len')
   has:   require('./has')
   get:   require('./get')
   set:   require('./set')
   del:   require('./del')
   merge: require('./merge')
   count: require('./count')
   sum:   require('./sum')

   # → Array-like
   index:      require('./index_')
   contain:    require('./contain')
   first:      require('./first')
   last:       require('./last')
   concat:     require('./concat')
   randomItem: require('./randomItem')
   deleteItem: require('./deleteItem')

   # → String
   match: require('./match')

   # → Function
   switch:   require('./switch')
   Switcher: require('./Switcher')

   # → Others
   error: require('./error')
   sleep: require('./sleep')
   noop:  require('./noop')