require('colors')


Server = require('./lib/http/Server')
Client = require('./lib/http/Client')


server = new Server
client = new Client({
  urlBase: 'http://127.0.0.1:3000'
})


client.on 'before-send', (opt) ->
  opt.data.name = 'iiiii'



server.get('/', (data)->
  console.log @abc
  return new Date
)

server.mount('abc', 'ghg')


server.listen(3000)
console.log 'ok'.green



done = (res) ->
  console.log res


fail = (error, res) ->
  console.log error


Promise.prototype.done = (done) -> @then  (res) => done(res.data, res)
Promise.prototype.fail = (fail) -> @catch (res) => fail(res.response.data, res.response)


do ->
  client.get('/', {
    name: 'kid'
  }).done(done).fail(fail)