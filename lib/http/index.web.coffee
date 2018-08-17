module.exports =

   http:
      get:    require('./get')
      post:   require('./post')
      put:    require('./put')
      patch:  require('./patch')
      delete: require('./delete')

      Client: require('./Client')