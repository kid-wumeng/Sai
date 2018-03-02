require('coffeescript/register')

try{

  require('./play.coffee')
  module.exports = require('./index.coffee')

}catch(error){
  console.log(error);
}