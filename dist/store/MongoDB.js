// Generated by CoffeeScript 2.3.1
(function() {
  var Collection, MongoDB, _, mongodb;

  _ = require('lodash');

  mongodb = require('mongodb');

  Collection = require('./MongoDB.Collection');

  module.exports = MongoDB = class MongoDB {
    constructor(opt = {}) {
      var ref, ref1, ref2, ref3;
      this.connect = this.connect.bind(this);
      this._uri = this._uri.bind(this);
      this.close = this.close.bind(this);
      this.drop = this.drop.bind(this);
      this._ensureAutoIDStore = this._ensureAutoIDStore.bind(this);
      this._ensureAutoIDStoreEach = this._ensureAutoIDStoreEach.bind(this);
      this.hide = this.hide.bind(this);
      this.col = this.col.bind(this);
      //#######################################
      //|
      //|   @params {object} opt
      //|           {string} opt.host = '0.0.0.0'
      //|           {number} opt.port =  27017
      //|           {string} opt.name = 'test'
      //|           {string} opt.user
      //|           {string} opt.pass
      //|           {bool}   opt.autoID = false
      //|           {string} opt.autoIDStore
      //|
      //#######################################
      this._host = (ref = opt.host) != null ? ref : '0.0.0.0';
      this._port = (ref1 = opt.port) != null ? ref1 : 27017;
      this._name = (ref2 = opt.name) != null ? ref2 : 'test';
      this._user = opt.user;
      this._pass = opt.pass;
      this._autoID = (ref3 = opt.autoID) != null ? ref3 : false;
      this._autoIDStore = opt.autoIDStore;
      this._client = null;
      this._db = null;
      this._cols = {};
      this._hides = {};
    }

    async connect() {
      var uri;
      //#######################################
      //|
      //|   Connect the database.
      //|
      //|   @async-function
      //|
      //|   @params {object} opt
      //|           {string} opt.host = '0.0.0.0'
      //|           {number} opt.port = 27017
      //|           {string} opt.name = 'test'
      //|           {string} opt.user
      //|           {string} opt.pass
      //|           {bool}   opt.autoID = false
      //|           {string} opt.autoIDCol
      //|
      //#######################################
      uri = this._uri();
      this._client = (await mongodb.MongoClient.connect(uri));
      this._db = this._client.db(this._name);
      if (this._autoID) {
        await this._ensureAutoIDStore();
      }
    }

    _uri() {
      //#######################################
      //|
      //|   Format and return a mongo's uri, reference:
      //|      https://docs.mongodb.com/manual/reference/connection-string/
      //|
      //|   @return {string} uri
      //|
      //#######################################
      if (this._user) {
        return `mongodb://${this._user}:${this._pass}@${this._host}:${this._port}/${this._name}`;
      } else {
        return `mongodb://${this._host}:${this._port}/${this._name}`;
      }
    }

    async close() {
      //#######################################
      //|
      //|   Format and return a mongo's uri, reference:
      //|      https://docs.mongodb.com/manual/reference/connection-string/
      //|
      //|   @return {string} uri
      //|
      //#######################################
      return (await this._client.close());
    }

    async drop() {
      //#######################################
      //|
      //|   Drop the database ( the connection will be kept ).
      //|
      //|   @async-function
      //|
      //#######################################
      return (await this._db.dropDatabase());
    }

    async _ensureAutoIDStore() {
      var i, len, results, store, stores;
      if (!this._autoIDStore) {
        throw "store.MongoDB._ensureAutoIDStore >>> You should set an { autoIDStore } when open the { autoID }.";
      }
      stores = (await this.col(this._autoIDStore).find());
      results = [];
      for (i = 0, len = stores.length; i < len; i++) {
        store = stores[i];
        results.push((await this._ensureAutoIDStoreEach(store)));
      }
      return results;
    }

    async _ensureAutoIDStoreEach(store) {
      var col, lastDoc, lastID;
      //#######################################
      //|
      //|   @async-function
      //|   @errors
      //|
      //#######################################
      col = store._id;
      lastID = store.lastID;
      lastDoc = (await this._db.collection(col).findOne({
        'id': {
          $exists: true
        }
      }, {
        sort: {
          'id': -1
        },
        projection: {
          'id': 1
        }
      }));
      if (lastDoc && lastDoc.id > store.lastID) {
        throw `store.MongoDB._ensureAutoIDStore >>> See the collection { ${col} }, the last-document's id is greater than { ${this._autoIDStore} }.`;
      }
    }

    hide(col, key) {
      if (!this._hides[col]) {
        this._hides[col] = [];
      }
      this._hides[col].push(key);
      return this;
    }

    col(name) {
      if (!this._cols[name]) {
        this._cols[name] = new Collection({
          db: this._db,
          hides: this._hides,
          autoID: this._autoID,
          autoIDStore: this._autoIDStore,
          name: name
        });
      }
      return this._cols[name];
    }

  };

}).call(this);
