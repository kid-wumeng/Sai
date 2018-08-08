suite "middleware", ->


   server = null


   setup ->
      server = new sai.http.Server()

      server.all '*', ->
         try
            await @next()
         catch error
            return error

      server.get '/pass', -> return 'pass'
      server.get '/fail', -> throw  'fail'

      server = server.listen(12345)


   teardown ->
      server.close()
      server = null


   test "pass", ->
      res = await sai.http.get('http://127.0.0.1:12345/pass')
      res.data.should.eql('pass')


   test "fail", ->
      res = await sai.http.get('http://127.0.0.1:12345/fail')
      res.data.should.eql('fail')