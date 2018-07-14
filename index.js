require('coffeescript/register')
lodash = require('lodash')


module.exports = sai = require('./lib')








;(async function(){

   try {



      class Animal {

         constructor(){
            this.ab = 'kid'
         }

         add(){
            sai.switch([], null)
               .case().then(this.add_str)
         }

         add_str(){
            console.log(this);
         }
      }


      animal = new Animal()

      animal.add()



      //
      // switcher = new sai.Switcher([1])
      // result = switcher
      //    .case(1).then(fn)
      //    .result()
      //
      // console.log(await result);



   } catch (error) {
      console.log(error.name)
      console.log(error.message)
   }

})()





