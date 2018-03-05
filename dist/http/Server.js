// Generated by CoffeeScript 2.2.2
(function() {
  var Koa, Router, Server, bodyParser, cors;

  Koa = require('koa');

  bodyParser = require('koa-bodyparser');

  cors = require('koa2-cors');

  Router = require('koa-router');

  module.exports = Server = class Server {
    constructor(opt = {}) {
      var defaults;
      //#######################################
      //|
      //|  @params {string}   path
      //|  @params {function} callback(data)
      //|
      //#######################################
      this.all = this.all.bind(this);
      this.get = this.get.bind(this);
      this.post = this.post.bind(this);
      this.put = this.put.bind(this);
      this.patch = this.patch.bind(this);
      this.delete = this.delete.bind(this);
      this._use = this._use.bind(this);
      this.mount = this.mount.bind(this);
      this._wrapMiddleware = this._wrapMiddleware.bind(this);
      this._wrapContent = this._wrapContent.bind(this);
      this._runCallback = this._runCallback.bind(this);
      this._handleRequest = this._handleRequest.bind(this);
      this._getRequestData = this._getRequestData.bind(this);
      this._handleError = this._handleError.bind(this);
      this._handleResponse = this._handleResponse.bind(this);
      this.listen = this.listen.bind(this);
      //#######################################
      //|
      //|  @params {object} opt
      //|          {bool}   opt.cors
      //|
      //#######################################
      defaults = {
        cors: false
      };
      this.opt = Object.assign(defaults, opt);
      this.app = new Koa;
      this.router = new Router;
      this._mounts = {};
    }

    all(path, callback) {
      return this._use('all', path, callback);
    }

    get(path, callback) {
      return this._use('get', path, callback);
    }

    post(path, callback) {
      return this._use('post', path, callback);
    }

    put(path, callback) {
      return this._use('put', path, callback);
    }

    patch(path, callback) {
      return this._use('patch', path, callback);
    }

    delete(path, callback) {
      return this._use('delete', path, callback);
    }

    _use(method, path = '*', callback = function() {}) {
      var mid;
      //#######################################
      //|
      //|  Register a route.
      //|
      //|  @params {string}   method
      //|  @params {string}   path
      //|  @params {function} callback(data)
      //|
      //#######################################
      mid = this._wrapMiddleware(callback);
      this.router[method](path, mid);
    }

    mount(name, value) {
      //#######################################
      //|
      //|  Mount something to context.
      //|
      //|  @params {string} name
      //|  @params {*}      value
      //|
      //|  @return {Server} this
      //|
      //#######################################
      this._mounts[name] = value;
      return this;
    }

    _wrapMiddleware(callback) {
      //#######################################
      //|
      //|  Wrap a callback to koa's middleware.
      //|
      //|  @params {function} callback(data)
      //|  @return {function} middleware(ctx, next)
      //|
      //#######################################
      return async(ctx, next) => {
        ctx = this._wrapContent(ctx);
        return (await this._runCallback(ctx, callback));
      };
    }

    _wrapContent(ctx) {
      //#######################################
      //|
      //|  Wrap a context from koa's context.
      //|
      //|  @params {object} koa-ctx
      //|  @return {object} ctx
      //|
      //#######################################
      ctx = {
        raw: ctx,
        req: {},
        res: {}
      };
      Object.assign(ctx, this._mounts);
      return ctx;
    }

    async _runCallback(ctx, callback) {
      var error;
      try {
        //#######################################
        //|
        //|  Run the callback to handle request and response.
        //|
        //|  @params {object}   ctx
        //|  @params {function} callback(data)
        //|
        //#######################################
        this._handleRequest(ctx);
        ctx.res.data = (await callback.call(ctx, ctx.req.data));
      } catch (error1) {
        error = error1;
        this._handleError(ctx, error);
      } finally {
        this._handleResponse(ctx);
      }
    }

    _handleRequest(ctx) {
      //#######################################
      //|
      //|  @params {object} ctx
      //|
      //#######################################
      ctx.req.method = ctx.raw.method;
      ctx.req.data = this._getRequestData(ctx);
    }

    _getRequestData(ctx) {
      var ref, ref1;
      //#######################################
      //|
      //|  Get the data from query(GET) or body(non-GET)
      //|
      //|  @params {object} ctx
      //|  @return {object} data
      //|
      //#######################################
      if (ctx.raw.method === 'GET') {
        return (ref = ctx.raw.query) != null ? ref : {};
      } else {
        return (ref1 = ctx.raw.request.body) != null ? ref1 : {};
      }
    }

    _handleError(ctx, error) {
      //#######################################
      //|
      //|  @params {object} ctx
      //|  @params {*}      error
      //|
      //#######################################
      return ctx.res.data = error;
    }

    _handleResponse(ctx) {
      var ref;
      //#######################################
      //|
      //|  @params {object} ctx
      //|
      //#######################################
      ctx.raw.body = ctx.res.data;
      return ctx.raw.status = (ref = ctx.res.status) != null ? ref : 200;
    }

    listen(port = 80) {
      //#######################################
      //|
      //|  Use common middlewares and start server.
      //|
      //|  @params {number} port
      //|
      //#######################################

      // @TODO To handle by opt.cors and more opt.
      this.app.use(cors());
      this.app.use(bodyParser());
      this.app.use(this.router.routes());
      this.app.listen(port);
    }

  };

}).call(this);
