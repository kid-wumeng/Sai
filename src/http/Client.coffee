axios            = require('axios')
ObservableObject = require('../util/ObservableObject')



module.exports = class Client extends ObservableObject



   constructor: ( opt = {} ) ->

      ########################################
      #|
      #|  @params {object} opt
      #|
      ########################################

      super()

      defaults =
         urlBase: ''

      @opt = Object.assign(defaults, opt)





   url: ( path ) =>

      ########################################
      #|
      #|  @params {string} path
      #|  @return {string} url
      #|
      ########################################

      return @opt.urlBase + path





   ########################################
   #|
   #|  @params {string} path
   #|  @params {object} data
   #|  @params {object} opt
   #|
   #|  @return {Promise} axios-promise
   #|
   ########################################

   get:    ( path, data, opt ) => @_call('get',    path, data, opt)
   post:   ( path, data, opt ) => @_call('post',   path, data, opt)
   put:    ( path, data, opt ) => @_call('put',    path, data, opt)
   patch:  ( path, data, opt ) => @_call('patch',  path, data, opt)
   delete: ( path, data, opt ) => @_call('delete', path, data, opt)


   _call: ( method, path = '', data = {}, opt = {} ) =>

      ########################################
      #|
      #|  Send the request.
      #|
      #|  @params {string} method
      #|  @params {string} path
      #|  @params {object} data
      #|  @params {object} opt
      #|
      #|  @events {'before-send'}(opt)
      #|
      #|  @return {Promise} axios-promise
      #|
      ########################################

      @_readyOptions(opt, method, path, data)

      @_emit('before-send', opt)

      @_adaptOptions(opt)

      return axios(opt)





   _readyOptions: ( opt, method, path, data ) =>

      ########################################
      #|
      #|  Ready the opt for call axios(opt).
      #|
      #|  @params {object} opt
      #|  @params {string} method
      #|  @params {string} path
      #|  @params {object} data
      #|
      ########################################

      url = @url(path)

      Object.assign(opt, { method, url, data })

      return





   _adaptOptions: ( opt ) =>

      ########################################
      #|
      #|  Set opt.data to opt.params when GET.
      #|
      #|  @params {object} opt
      #|
      ########################################

      if opt.method is 'get'

         opt.params = opt.data

         delete opt.data

      return