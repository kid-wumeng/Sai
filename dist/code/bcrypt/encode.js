// Generated by CoffeeScript 2.2.2
(function() {
  var bcrypt, encode;

  bcrypt = require('bcrypt-nodejs');

  module.exports = encode = async(data) => {
    //#######################################
    //|
    //|   @async-function
    //|
    //|   @params {string} data
    //|   @return {string} hash
    //|
    //#######################################
    return (await new Promise((resolve, reject) => {
      return bcrypt.genSalt(null, (error, salt) => {
        if (error) {
          return reject(error);
        } else {
          return bcrypt.hash(data, salt, null, (error, hash) => {
            if (error) {
              return reject(error);
            } else {
              return resolve(hash);
            }
          });
        }
      });
    }));
  };

}).call(this);
