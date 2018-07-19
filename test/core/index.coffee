suite '~core', ->

   # → Common
   require('./type')
   require('./equal')

   # → Object
   require('./get')

   # → Array-like
   require('./index_')
   require('./contain')
   require('./first')
   require('./last')
   require('./concat')

   # → String
   require('./match')

   # → Function
   require('./Switcher')
   require('./Switcher@case')
   require('./Switcher@then')
   require('./Switcher@default')

   # → Others
   require('./error')