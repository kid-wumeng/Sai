suite "base", ->


   server = null


   setup ->
      server = new sai.http.Server({
         paramCastNumber: true
         queryCastNumber: true
      })
      server.get(   '/:id', ({ id, value }) => id + value + 100)
      server.post(  '/:id', ({ id, value }) => id + value + 200)
      server.put(   '/:id', ({ id, value }) => id + value + 300)
      server.patch( '/:id', ({ id, value }) => id + value + 400)
      server.delete('/:id', ({ id, value }) => id + value + 500)
      server = server.listen(12345)


   teardown ->
      server.close()
      server = null


   test "http.get", ->
      res = await sai.http.get('http://127.0.0.1:12345/1', { value: 50 })
      res.data.should.eql(151)


   test "http.post", ->
      res = await sai.http.post('http://127.0.0.1:12345/1', { value: 50 })
      res.data.should.eql(251)


   test "http.put", ->
      res = await sai.http.put('http://127.0.0.1:12345/1', { value: 50 })
      res.data.should.eql(351)


   test "http.patch", ->
      res = await sai.http.patch('http://127.0.0.1:12345/1', { value: 50 })
      res.data.should.eql(451)


   test "http.delete", ->
      res = await sai.http.delete('http://127.0.0.1:12345/1', { value: 50 })
      res.data.should.eql(551)


   test "Client@get", ->
      client = new sai.http.Client({ urlBase: 'http://127.0.0.1:12345' })
      res = await client.get('/1', { value: 50 })
      res.data.should.eql(151)


   test "Client@post", ->
      client = new sai.http.Client({ urlBase: 'http://127.0.0.1:12345' })
      res = await client.post('/1', { value: 50 })
      res.data.should.eql(251)


   test "Client@put", ->
      client = new sai.http.Client({ urlBase: 'http://127.0.0.1:12345' })
      res = await client.put('/1', { value: 50 })
      res.data.should.eql(351)


   test "Client@patch", ->
      client = new sai.http.Client({ urlBase: 'http://127.0.0.1:12345' })
      res = await client.patch('/1', { value: 50 })
      res.data.should.eql(451)


   test "Client@delete", ->
      client = new sai.http.Client({ urlBase: 'http://127.0.0.1:12345' })
      res = await client.delete('/1', { value: 50 })
      res.data.should.eql(551)