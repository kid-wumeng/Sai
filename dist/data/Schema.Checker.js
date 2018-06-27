// Generated by CoffeeScript 2.3.1
(function() {
  var Checker, MIME, isArray, isBool, isBuffer, isDate, isNil, isNumber, isObject, isPlainObject, isString;

  isNil = require('./isNil');

  isBool = require('./isBool');

  isNumber = require('./isNumber');

  isString = require('./isString');

  isBuffer = require('./isBuffer');

  isDate = require('./isDate');

  isArray = require('./isArray');

  isObject = require('./isObject');

  isPlainObject = require('./isPlainObject');

  MIME = require('./mime');

  module.exports = Checker = class Checker {
    constructor(opt = {}) {
      this.name = this.name.bind(this);
      this.required = this.required.bind(this);
      this.bool = this.bool.bind(this);
      this.number = this.number.bind(this);
      this.string = this.string.bind(this);
      this.buffer = this.buffer.bind(this);
      this.date = this.date.bind(this);
      this.array = this.array.bind(this);
      this.plainObject = this.plainObject.bind(this);
      this.is = this.is.bind(this);
      this.in = this.in.bind(this);
      this.min = this.min.bind(this);
      this.max = this.max.bind(this);
      this._min_number = this._min_number.bind(this);
      this._max_number = this._max_number.bind(this);
      this._min_string = this._min_string.bind(this);
      this._max_string = this._max_string.bind(this);
      this._min_buffer = this._min_buffer.bind(this);
      this._max_buffer = this._max_buffer.bind(this);
      this.mime = this.mime.bind(this);
      this.format = this.format.bind(this);
      this.check = this.check.bind(this);
      this.rule = this.rule.bind(this);
      this._displayName = this._displayName.bind(this);
      this._displayData = this._displayData.bind(this);
      //#######################################
      //|
      //|   @params {object} opt
      //|           {object} opt.rules   - {name: check(function)}
      //|           {object} opt.formats - {name: check(function)}
      //|           {*}      opt.data
      //|
      //#######################################
      this._rules = opt.rules;
      this._formats = opt.formats;
      this._data = opt.data;
      this._name = '';
    }

    name(name) {
      //#######################################
      //|
      //|   @params {string}  name
      //|   @return {Checker} this
      //|
      //#######################################
      this._name = name;
      return this;
    }

    required(error) {
      //#######################################
      //|
      //|   @params {*} error
      //|   @errors
      //|   @return {Checker} this
      //|
      //#######################################
      if (isNil(this._data)) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} is required`;
        }
        throw new Error(error);
      }
      return this;
    }

    bool(error) {
      //#######################################
      //|
      //|   @params {*} error
      //|   @errors
      //|   @return {Checker} this
      //|
      //#######################################
      if ((this._data != null) && !isBool(this._data)) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} should be a bool, current is ${this._displayData()}`;
        }
        throw new Error(error);
      }
      return this;
    }

    number(error) {
      //#######################################
      //|
      //|   @params {*} error
      //|   @errors
      //|   @return {Checker} this
      //|
      //#######################################
      if ((this._data != null) && !isNumber(this._data)) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} should be a number, current is ${this._displayData()}`;
        }
        throw new Error(error);
      }
      return this;
    }

    string(error) {
      //#######################################
      //|
      //|   @params {*} error
      //|   @errors
      //|   @return {Checker} this
      //|
      //#######################################
      if ((this._data != null) && !isString(this._data)) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} should be a string, current is ${this._displayData()}`;
        }
        throw new Error(error);
      }
      return this;
    }

    buffer(error) {
      //#######################################
      //|
      //|   @params {*} error
      //|   @errors
      //|   @return {Checker} this
      //|
      //#######################################
      if ((this._data != null) && !isBuffer(this._data)) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} should be a Buffer, current is ${this._displayData()}`;
        }
        throw new Error(error);
      }
      return this;
    }

    date(error) {
      //#######################################
      //|
      //|   @params {*} error
      //|   @errors
      //|   @return {Checker} this
      //|
      //#######################################
      if ((this._data != null) && !isDate(this._data)) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} should be a Date, current is ${this._displayData()}`;
        }
        throw new Error(error);
      }
      return this;
    }

    array(error) {
      //#######################################
      //|
      //|   @params {*} error
      //|   @errors
      //|   @return {Checker} this
      //|
      //#######################################
      if ((this._data != null) && !isArray(this._data)) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} should be an Array, current is ${this._displayData()}`;
        }
        throw new Error(error);
      }
      return this;
    }

    plainObject(error) {
      //#######################################
      //|
      //|   @params {*} error
      //|   @errors
      //|   @return {Checker} this
      //|
      //#######################################
      if ((this._data != null) && !isPlainObject(this._data)) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} should be a plain-object, current is ${this._displayData()}`;
        }
        throw new Error(error);
      }
      return this;
    }

    is(constructor, error) {
      //#######################################
      //|
      //|   @params {Class} constructor
      //|   @params {*}     error
      //|   @errors
      //|   @return {Checker} this
      //|
      //#######################################
      if ((this._data != null) && !(this._data instanceof constructor)) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} should be a < ${constructor.name} >, current is ${this._displayData()}`;
        }
        throw new Error(error);
      }
      return this;
    }

    in(enums, error) {
      //#######################################
      //|
      //|   @params {*[]} enums
      //|   @params {*}   error
      //|   @errors
      //|   @return {Checker} this
      //|
      //#######################################
      if ((this._data != null) && !enums.includes(this._data)) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} should be in [${enums.join(', ')}], current is ${this._displayData()}`;
        }
        throw new Error(error);
      }
      return this;
    }

    min(min, error) {
      //#######################################
      //|
      //|   @params {number} min
      //|   @params {*}      error
      //|   @errors
      //|   @return {Checker} this
      //|
      //#######################################
      if (this._data != null) {
        switch (false) {
          case !isNumber(this._data):
            this._min_number(min, error);
            break;
          case !isString(this._data):
            this._min_string(min, error);
            break;
          case !isBuffer(this._data):
            this._min_buffer(min, error);
        }
      }
      return this;
    }

    max(max, error) {
      //#######################################
      //|
      //|   @params {number} max
      //|   @params {*}      error
      //|   @errors
      //|   @return {Checker} this
      //|
      //#######################################
      if (this._data != null) {
        switch (false) {
          case !isNumber(this._data):
            this._max_number(max, error);
            break;
          case !isString(this._data):
            this._max_string(max, error);
            break;
          case !isBuffer(this._data):
            this._max_buffer(max, error);
        }
      }
      return this;
    }

    _min_number(min, error) {
      if (this._data < min) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} should be ≥ ${min}, current is ${this._data}`;
        }
        throw new Error(error);
      }
    }

    _max_number(max, error) {
      if (this._data > max) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} should be ≤ ${max}, current is ${this._data}`;
        }
        throw new Error(error);
      }
    }

    _min_string(min, error) {
      if (this._data.length < min) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} length should be ≥ ${min}, current is ${this._data.length}`;
        }
        throw new Error(error);
      }
    }

    _max_string(max, error) {
      if (this._data.length > max) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} length should be ≤ ${max}, current is ${this._data.length}`;
        }
        throw new Error(error);
      }
    }

    _min_buffer(min, error) {
      if (this._data.length < min) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} length should be ≥ ${min}, current is ${this._data.length}`;
        }
        throw new Error(error);
      }
    }

    _max_buffer(max, error) {
      if (this._data.length > max) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} length should be ≤ ${max}, current is ${this._data.length}`;
        }
        throw new Error(error);
      }
    }

    mime(mimes, error) {
      var mime;
      //#######################################
      //|
      //|   @params {string[]} mimes
      //|   @params {*}        error
      //|   @errors
      //|   @return {Checker}  this
      //|
      //#######################################
      if (this._data != null) {
        mime = MIME(this._data);
        if (!mimes.includes(mime)) {
          mimes = mimes.map((m) => {
            return `'${m}'`;
          });
          if (error == null) {
            error = `Sorry, the ${this._displayName()} MIME should be in ${mimes.join(', ')}, current is ${mime}`;
          }
          throw new Error(error);
        }
      }
      return this;
    }

    format(format, error) {
      var check;
      //#######################################
      //|
      //|   @params {string} format
      //|   @params {*}      error
      //|   @errors
      //|   @return {Checker} this
      //|
      //#######################################
      if (this._data != null) {
        check = this._formats[format];
        if (!_.isFunction(check)) {
          throw new Error(`The format '${format}' hasn't registered yet`);
        }
        if (check(this._data) !== true) {
          if (error == null) {
            error = `Sorry, the ${this._displayName()} format should be '${format}', current is ${this._displayData()}`;
          }
          throw new Error(error);
        }
      }
      return this;
    }

    check(check, error) {
      if (!_.isFunction(check)) {
        throw new Error("The check isn't a function");
      }
      if (check(this._data) !== true) {
        if (error == null) {
          error = `Sorry, the ${this._displayName()} check fail`;
        }
        throw new Error(error);
      }
      return this;
    }

    rule(rule) {
      var check;
      //#######################################
      //|
      //|   @params {string}  rule
      //|   @errors
      //|   @return {Checker} this
      //|
      //#######################################
      check = this._rules[rule];
      if (_.isFunction(check)) {
        if (this._data != null) {
          check(this._data);
        }
      } else {
        throw new Error(`The rule '${rule}' hasn't registered yet`);
      }
      return this;
    }

    _displayName() {
      var name;
      //#######################################
      //|
      //|   Format the name for error's message.
      //|
      //|   @return {string} displayName
      //|
      //#######################################
      name = this._name;
      if (name) {
        return "'" + name + "'";
      } else {
        return "data";
      }
    }

    _displayData() {
      var data;
      //#######################################
      //|
      //|   Format the data for error's message.
      //|
      //|   @return {string} displayData
      //|
      //#######################################
      data = this._data;
      switch (false) {
        case !isBool(data):
          return "{ " + data + " }";
        case !isString(data):
          return "'" + data + "'";
        case !isArray(data):
          return "[ " + data.join(', ') + " ]";
        case !isPlainObject(data):
          return data;
        case !isObject(data):
          return "< " + data.constructor.name + " >";
        default:
          return data;
      }
    }

  };

}).call(this);
