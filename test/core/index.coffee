suite '~core', ->

   # → Base
   require('./type')
   require('./equal')
   require('./clone')

   # → Number
   require('./min')
   require('./max')

   # → Object
   require('./len')
   require('./has')
   require('./get')
   require('./set')
   require('./del')
   require('./merge')
   require('./count')
   require('./sum')

   # → Array-like
   require('./index_')
   require('./contain')
   require('./first')
   require('./last')
   require('./concat')
   require('./randomItem')
   require('./deleteItem')

   # → String
   require('./match')

   # → Function
   require('./Switcher')
   require('./Switcher@case')
   require('./Switcher@then')
   require('./Switcher@default')

   # → Others
   require('./error')