// Generated by CoffeeScript 2.2.2
(function() {
  var Collection, _, array;

  _ = require('lodash');

  array = require('../array');

  module.exports = Collection = class Collection {
    constructor(opt = {}) {
      this.findOne = this.findOne.bind(this);
      this.find = this.find.bind(this);
      this.count = this.count.bind(this);
      this._formatQuery = this._formatQuery.bind(this);
      this._formatOptions = this._formatOptions.bind(this);
      this._formatOptions_sort = this._formatOptions_sort.bind(this);
      this._formatOptions_page = this._formatOptions_page.bind(this);
      this._formatOptions_projection = this._formatOptions_projection.bind(this);
      this._formatOptions_hide = this._formatOptions_hide.bind(this);
      this.insertOne = this.insertOne.bind(this);
      this.insertMany = this.insertMany.bind(this);
      this._makeIDs = this._makeIDs.bind(this);
      this.findOneAndUpdate = this.findOneAndUpdate.bind(this);
      this.updateOne = this.updateOne.bind(this);
      this.updateMany = this.updateMany.bind(this);
      this._formatModifier = this._formatModifier.bind(this);
      this.deleteOne = this.deleteOne.bind(this);
      this.deleteMany = this.deleteMany.bind(this);
      this.aggregate = this.aggregate.bind(this);
      //#######################################
      //|
      //|  @params {object}     opt
      //|          {mongodb.Db} opt.db
      //|          {object}     opt.hides - { user: ['email', 'pass', ...], ... }
      //|          {bool}       opt.autoID
      //|          {string}     opt.autoIDStore
      //|          {string}     opt.name
      //|
      //#######################################
      this._db = opt.db;
      this._hides = opt.hides;
      this._autoID = opt.autoID;
      this._autoIDStore = opt.autoIDStore;
      this._name = opt.name;
      this._col = this._db.collection(this._name);
    }

    async findOne(query = {}, opt = {}) {
      //#######################################
      //|
      //|  @async-function
      //|
      //|  @params {object} query
      //|  @params {object} opt
      //|
      //|  @return {object} doc
      //|
      //#######################################
      query = this._formatQuery(query);
      opt = this._formatOptions(opt);
      return (await this._col.findOne(query, opt));
    }

    async find(query = {}, opt = {}) {
      //#######################################
      //|
      //|  @async-function
      //|
      //|  @params {object}   query
      //|  @params {object}   opt
      //|
      //|  @return {object[]} docs
      //|
      //#######################################
      query = this._formatQuery(query);
      opt = this._formatOptions(opt);
      return (await this._col.find(query, opt).toArray());
    }

    async count(query = {}, opt = {}) {
      //#######################################
      //|
      //|  @async-function
      //|
      //|  @params {object} query
      //|  @params {object} opt
      //|
      //|  @return {number} count
      //|
      //#######################################
      query = this._formatQuery(query);
      opt = this._formatOptions(opt);
      return (await this._col.count(query, opt));
    }

    _formatQuery(query = {}) {
      //#######################################
      //|
      //|  @params {object|number} query | doc's id
      //|  @return {object}        query
      //|
      //#######################################
      if (_.isFinite(query)) {
        query = {
          id: query
        };
      }
      return Object.assign({}, query);
    }

    _formatOptions(opt = {}) {
      //#######################################
      //|
      //|  @params {object|string} opt | projection
      //|  @return {object}        opt
      //|
      //#######################################
      if (_.isString(opt)) {
        opt = {
          projection: opt
        };
      }
      opt = Object.assign({}, opt);
      this._formatOptions_sort(opt);
      this._formatOptions_page(opt);
      this._formatOptions_projection(opt);
      this._formatOptions_hide(opt);
      return opt;
    }

    _formatOptions_sort(opt) {
      //#######################################
      //|
      //|  @params {object|string} opt
      //|
      //#######################################
      if (_.isNumber(opt.sort)) {
        opt.sort = {
          _id: opt.sort
        };
      }
    }

    _formatOptions_page(opt) {
      var page, ref, ref1, ref2, size, skip;
      //#######################################
      //|
      //|  @params {object} opt
      //|
      //#######################################
      page = (ref = opt.page) != null ? ref : 1;
      size = (ref1 = opt.size) != null ? ref1 : 0;
      skip = (ref2 = opt.skip) != null ? ref2 : 0;
      opt.skip = skip + (page - 1) * size;
      opt.limit = size;
      delete opt.page;
      delete opt.size;
    }

    _formatOptions_projection(opt) {
      var dict, i, key, len, string;
      //#######################################
      //|
      //|  @params {object} opt
      //|
      //#######################################
      if (opt.projection == null) {
        opt.projection = {};
      }
      if (_.isString(opt.projection)) {
        // {string} => {array} => {dict}
        // eg:
        //    'name age'   => ['name', 'age']   => { name: 1, age: 1 }
        //    '-name -age' => ['-name', '-age'] => { name: 0, age: 0 }
        string = opt.projection;
        array = string.split(/\s+/);
        dict = {};
        for (i = 0, len = array.length; i < len; i++) {
          key = array[i];
          if (key[0] === '-') {
            key = key.slice(1);
            dict[key] = 0;
          } else {
            dict[key] = 1;
          }
        }
        opt.projection = dict;
      }
    }

    _formatOptions_hide(opt) {
      var hideKeys, i, key, len;
      //#######################################
      //|
      //|  Call this method must after @_formatOptions_projection(),
      //|  because it is depend on {opt.projection}
      //|
      //|  @params {object} opt
      //|
      //#######################################
      hideKeys = this._hides[this._name];
      if (!hideKeys) {
        return;
      }
      if (opt.hide === true) {
        return;
      }
      if (Object.values(opt.projection)[0] === 1) {
        return;
      }
      for (i = 0, len = hideKeys.length; i < len; i++) {
        key = hideKeys[i];
        opt.projection[key] = 0;
      }
    }

    async insertOne(doc = {}) {
      var result;
      if (!doc.id && this._autoID) {
        doc.id = (await this._makeIDs());
      }
      if (!doc.createDate) {
        doc.createDate = new Date();
      }
      result = (await this._col.insertOne(doc));
      return result.ops[0];
    }

    async insertMany(docs = []) {
      var count, doc, i, len, result, start;
      //#######################################
      //|
      //|  @async-function
      //|
      //|  @params {object} docs
      //|  @return {object} docs ( includes _id, id and createDate )
      //|
      //#######################################
      if (this._autoID) {
        count = array.count(docs, function(doc) {
          return !doc.id;
        });
        start = (await this._makeIDs(count));
      }
      for (i = 0, len = docs.length; i < len; i++) {
        doc = docs[i];
        if (!doc.id && this._autoID) {
          doc.id = start;
          start++;
        }
        if (!doc.createDate) {
          doc.createDate = new Date();
        }
      }
      result = (await this._col.insertMany(docs));
      return result.ops;
    }

    async _makeIDs(count = 1) {
      var lastID, result, startID;
      //#######################################
      //|
      //|  Make one or some auto-increment ids and return the first.
      //|
      //|  @async-function
      //|
      //|  @params {number} count
      //|  @return {number} startID
      //|
      //#######################################
      result = (await this._db.collection(this._autoIDStore).findOneAndUpdate({
        _id: this._name
      }, {
        $inc: {
          lastID: count
        }
      }, {
        upsert: true,
        returnOriginal: false
      }));
      lastID = result.value.lastID;
      startID = lastID - (count - 1);
      return startID;
    }

    async findOneAndUpdate(query = {}, modifier = {}) {
      var opt, result;
      //#######################################
      //|
      //|  @async-function
      //|
      //|  @params {object} query
      //|  @params {object} modifier
      //|
      //|  @return {object} new-doc
      //|
      //#######################################
      query = this._formatQuery(query);
      modifier = this._formatModifier(modifier);
      opt = {
        returnOriginal: false
      };
      result = (await this._col.findOneAndUpdate(query, modifier, opt));
      return result.value;
    }

    async updateOne(query = {}, modifier = {}) {
      var result;
      //#######################################
      //|
      //|  @async-function
      //|
      //|  @params {object} query
      //|  @params {object} modifiedCount
      //|
      //|  @return {object} new-doc
      //|
      //#######################################
      query = this._formatQuery(query);
      modifier = this._formatModifier(modifier);
      result = (await this._col.updateOne(query, modifier));
      return result.modifiedCount;
    }

    async updateMany(query = {}, modifier = {}) {
      var result;
      //#######################################
      //|
      //|  @async-function
      //|
      //|  @params {object} query
      //|  @params {object} modifier
      //|
      //|  @return {number} modifiedCount
      //|
      //#######################################
      query = this._formatQuery(query);
      modifier = this._formatModifier(modifier);
      result = (await this._col.updateMany(query, modifier));
      return result.modifiedCount;
    }

    _formatModifier(modifier = {}) {
      var key, value;
      //#######################################
      //|
      //|  @params {object} modifier
      //|  @return {object} modifier
      //|
      //#######################################
      modifier = Object.assign({}, modifier);
      if (modifier.$set == null) {
        modifier.$set = {};
      }
      modifier.$set.updateDate = new Date();
      for (key in modifier) {
        value = modifier[key];
        if (key[0] === '$') {
          // $inc, $push...
          if (this._autoID) {
            delete value.id;
          }
        } else {
          modifier.$set[key] = value;
          delete modifier[key];
        }
      }
      return modifier;
    }

    async deleteOne(query = {}) {
      var result;
      //#######################################
      //|
      //|  @params {object} query
      //|
      //|  @return {number} deletedCount
      //|
      //#######################################
      query = this._formatQuery(query);
      result = (await this._col.deleteOne(query));
      return result.deletedCount;
    }

    async deleteMany(query = {}) {
      var result;
      //#######################################
      //|
      //|  @params {object} query
      //|
      //|  @return {number} deletedCount
      //|
      //#######################################
      query = this._formatQuery(query);
      result = (await this._col.deleteMany(query));
      return result.deletedCount;
    }

    async aggregate(pipeline, opt = {}) {
      //#######################################
      //|
      //|  @params {object[]} pipeline
      //|  @params {object}   opt
      //|
      //|  @return {object[]} results
      //|
      //#######################################
      return (await this._col.aggregate(pipeline, opt).toArray());
    }

  };

}).call(this);