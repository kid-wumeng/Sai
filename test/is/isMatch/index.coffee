suite "isMatch", ->

   test "isMatch('abc', /b/)",      -> sai.isMatch('abc', /b/).should.be.true
   test "isMatch('abc', 'b')",      -> sai.isMatch('abc', 'b').should.be.true

   test "isMatch('abc', 'B')",      -> sai.isMatch('abc', 'B').should.be.false
   test "isMatch('abc', 'B', 'i')", -> sai.isMatch('abc', 'B', 'i').should.be.true

   test "isMatch('[a]', '^[a]$')",     -> sai.isMatch('[a]', '^[a]$').should.be.false
   test "isMatch('[a]', '^\[a\]$')",   -> sai.isMatch('[a]', '^\[a\]$').should.be.false
   test "isMatch('[a]', '^\\[a\\]$')", -> sai.isMatch('[a]', '^\\[a\\]$').should.be.true
   test "isMatch('[a]', /^\[a\]$/)",   -> sai.isMatch('[a]', /^\[a\]$/).should.be.true


   protocol = 'http'
   domain   = 'google.com'

   test "isMatch('http://google.com', '#{protocol}:\/\/#{domain}')", ->
     sai.isMatch('http://google.com', "#{protocol}:\/\/#{domain}").should.be.true

   test "isMatch('file://google.com', '#{protocol}:\/\/#{domain}')", ->
     sai.isMatch('file://google.com', "#{protocol}:\/\/#{domain}").should.be.false