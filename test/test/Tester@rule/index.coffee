suite "Tester@rule", ->

   schema = new sai.Schema

   schema.rule 'user.name', (data) => sai.test(data).check (data) => /^\w+$/.test(data)

   test "test('ab')", -> (-> schema.test('ab').rule('user.name')).should.not.throw()
   test "test('--')", -> (-> schema.test('--').rule('user.name')).should.throw()