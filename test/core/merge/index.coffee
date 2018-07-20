suite "merge", ->

   test "merge(a, b, c)", ->

      a =
         name: 'sai',
         version: '1.0'
         browsers: ['netscape', 'ie']
         persons: [{ name: 'kid' }, { name: 'sai' }]

      b =
         version: '2.0',
         repo: 'https://github.com/kid-wumeng/sai'
         browsers: ['firefox', 'chrome', 'opera']
         persons: [{ age: 18 }, { age: 24 }]

      c =
         browsers: ['safari']

      sai.merge(a, b, c).should.eql({
         name: 'sai'
         version: '2.0'
         repo: 'https://github.com/kid-wumeng/sai'
         browsers: ['safari', 'chrome', 'opera']
         persons: [
            { name: 'kid', age: 18 }
            { name: 'sai', age: 24 }
         ]
      })