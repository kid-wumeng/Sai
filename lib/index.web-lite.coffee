exports.array = require('./array')

exports.data = require('./data')

exports.http =
   get:    require('./http/get')
   post:   require('./http/post')
   put:    require('./http/put')
   patch:  require('./http/patch')
   delete: require('./http/delete')
   Client: require('./http/Client')

exports.string = require('./string')

exports.time   = require('./time')

exports.util   = require('./util')