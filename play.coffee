# require('colors')
#
#
# Server = require('./src/http/Server')
# Client = require('./src/http/Client')
#
#
# server = new Server
# client = new Client({
#   urlBase: 'http://127.0.0.1:3000'
# })
#
#
# client.on 'before-send', (opt) ->
#   opt.data.name = 'iiiii'
#
#
#
# server.get('/', (data)->
#   aaa = new Date
#
#   console.log JSON.stringify({aaa: aaa})
#   console.log aaa.toString()
#   return new Date
# )
#
#
# server.listen(3000)
# console.log 'ok'.green
#
#
#
# done = (res) ->
#   console.log res
#
#
# fail = (error, res) ->
#   console.log error
#
#
# Promise.prototype.done = (done) -> @then  (res) => done(res.data, res)
# Promise.prototype.fail = (fail) -> @catch (res) => fail(res.response.data, res.response)
#
#
# do ->
#   client.get('/', {
#     name: 'kid'
#   }).done(done).fail(fail)



time = require('./src/time')

date = time.date(2018, 3, 1, 8, 20, 25)
console.log time.to(date)