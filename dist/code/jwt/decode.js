// Generated by CoffeeScript 2.2.2
(function() {
  var decode, jwt;

  jwt = require('jsonwebtoken');

  module.exports = decode = (token, secret) => {
    //#######################################
    //|
    //|  @params {string} token
    //|  @params {string} secret
    //|
    //|  @return {object} payload
    //|
    //#######################################
    return jwt.verify(token, secret);
  };

}).call(this);
