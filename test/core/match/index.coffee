suite "match", ->

   test "match('abc', /b/)",      -> sai.match('abc', /b/).should.be.true
   test "match('abc', 'b')",      -> sai.match('abc', 'b').should.be.true

   test "match('abc', 'B')",      -> sai.match('abc', 'B').should.be.false
   test "match('abc', 'B', 'i')", -> sai.match('abc', 'B', 'i').should.be.true

   test "match('[a]', '^[a]$')",     -> sai.match('[a]', '^[a]$').should.be.false
   test "match('[a]', '^\[a\]$')",   -> sai.match('[a]', '^\[a\]$').should.be.false
   test "match('[a]', '^\\[a\\]$')", -> sai.match('[a]', '^\\[a\\]$').should.be.true
   test "match('[a]', /^\[a\]$/)",   -> sai.match('[a]', /^\[a\]$/).should.be.true


   protocol = 'http'
   domain   = 'google.com'

   test "match('http://google.com', '#{protocol}://#{domain}')", ->
     sai.match('http://google.com', "#{protocol}://#{domain}").should.be.true

   test "match('file://google.com', '#{protocol}://#{domain}')", ->
     sai.match('file://google.com', "#{protocol}://#{domain}").should.be.false