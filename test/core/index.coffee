suite '~core', ->

   # → Common
   require('./type')
   require('./equal')

   # → Object
   require('./get')

   # → Array-like
   require('./index_')
   require('./contain')

   # → String
   require('./match')

   # → Function
   require('./Switcher')
   require('./Switcher@case')
   require('./Switcher@then')
   require('./Switcher@default')

   # → Others
   require('./error')