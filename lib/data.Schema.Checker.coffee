_       = require('lodash')
inspect = require('util').inspect



module.exports = class Checker



   constructor: ( opt = {} ) ->

      ########################################
      #|
      #|  @params {object} opt
      #|          {object} opt.rules   - {name: check(function)}
      #|          {object} opt.formats - {name: check(function)}
      #|          {*}      opt.data
      #|
      ########################################

      @_rules   = opt.rules
      @_formats = opt.formats
      @_data    = opt.data





   required: ( error ) =>

      ########################################
      #|
      #|  @params {*} error
      #|  @errors
      #|  @return {Checker} this
      #|
      ########################################

      if _.isNil(@_data)
         throw error ? "data.Schema.Checker.required >>>
                        Sorry, the data is required,
                        current is #{@_display(@_data)}."
      return @





   bool: ( error ) =>

      ########################################
      #|
      #|  @params {*} error
      #|  @errors
      #|  @return {Checker} this
      #|
      ########################################

      if !_.isBoolean(@_data)
         throw error ? "data.Schema.Checker.bool >>>
                        Sorry, the data should be a bool,
                        current is #{@_display(@_data)}."
      return @





   number: ( error ) =>

      ########################################
      #|
      #|  @params {*} error
      #|  @errors
      #|  @return {Checker} this
      #|
      ########################################

      if !_.isFinite(@_data)
         throw error ? "data.Schema.Checker.number >>>
                        Sorry, the data should be a number,
                        current is #{@_display(@_data)}."
      return @





   string: ( error ) =>

      ########################################
      #|
      #|  @params {*} error
      #|  @errors
      #|  @return {Checker} this
      #|
      ########################################

      if !_.isString(@_data)
         throw error ? "data.Schema.Checker.string >>>
                        Sorry, the data should be a string,
                        current is #{@_display(@_data)}."
      return @





   buffer: ( error ) =>

      ########################################
      #|
      #|  @params {*} error
      #|  @errors
      #|  @return {Checker} this
      #|
      ########################################

      if !_.isBuffer(@_data)
         throw error ? "data.Schema.Checker.buffer >>>
                        Sorry, the data should be a Buffer,
                        current is #{@_display(@_data)}."
      return @





   date: ( error ) =>

      ########################################
      #|
      #|  @params {*} error
      #|  @errors
      #|  @return {Checker} this
      #|
      ########################################

      if !_.isDate(@_data)
         throw error ? "data.Schema.Checker.date >>>
                        Sorry, the data should be a Date,
                        current is #{@_display(@_data)}."
      return @





   array: ( error ) =>

      ########################################
      #|
      #|  @params {*} error
      #|  @errors
      #|  @return {Checker} this
      #|
      ########################################

      if !_.isArray(@_data)
         throw error ? "data.Schema.Checker.array >>>
                        Sorry, the data should be an Array,
                        current is #{@_display(@_data)}."
      return @





   plainObject: ( error ) =>

      ########################################
      #|
      #|  @params {*} error
      #|  @errors
      #|  @return {Checker} this
      #|
      ########################################

      if !_.isPlainObject(@_data)
         throw error ? "data.Schema.Checker.plainObject >>>
                        Sorry, the data should be a plain-object,
                        current is #{@_display(@_data)}."
      return @





   is: ( constructor, error ) =>

      ########################################
      #|
      #|  @params {Class} constructor
      #|  @params {*}     error
      #|  @errors
      #|  @return {Checker} this
      #|
      ########################################

      if !( @_data instanceof constructor )
         throw error ? "data.Schema.Checker.is >>>
                        Sorry, the data should be a < #{constructor.name} >,
                        current is #{@_display(@_data)}."
      return @





   _display: ( data ) =>

      ########################################
      #|
      #|  Format the data for error's message.
      #|
      #|  @params {*} data
      #|  @return {string}
      #|
      ########################################

      switch
         when _.isBoolean(data)     then "{ " + data + " }"
         when _.isFinite(data)      then "{ " + data + " }"
         when _.isString(data)      then "'" + data + "'"
         when _.isArray(data)       then "[ " + data.join(', ') + " ]"
         when _.isPlainObject(data) then inspect(data)
         when _.isObject(data)      then "< " + data.constructor.name + " >"
         else data



   # if value?
   # switch
   # when type is Object
   # if !_.isPlainObject(value)
   #  message ?= "Sorry, the value's type should be plain-object."
   #  throw errors.VALIDATION_FAILED(message, {current: value})
   #
   # else
   # if !(value instanceof type)
   #  message ?= "Sorry, the value's type should be #{type.name}."
   #  throw errors.VALIDATION_FAILED(message, {current: value})
   #


  #
  #
  #
  # ### @Public ###
  # # 枚举验证
  # ##
  # enum: (enums, message) =>
  #   for value in @values
  #     enumCheck(value, enums, message)
  #   return @
  #
  #
  #
  # ### @Public ###
  # # 最小值验证
  # ##
  # min: (min, message) =>
  #   for value in @values
  #     minCheck(value, min, message)
  #   return @
  #
  #
  #
  # ### @Public ###
  # # 最大值验证
  # ##
  # max: (max, message) =>
  #   for value in @values
  #     maxCheck(value, max, message)
  #   return @
  #
  #
  #
  # ### @Public ###
  # # MIME验证
  # ##
  # mime: (mimes, message) =>
  #   for value in @values
  #     mimeCheck(value, mimes, message)
  #   return @
  #
  #
  #
  # ### @Public ###
  # # 格式验证
  # ##
  # format: (formats, message) =>
  #   for value in @values
  #     formatCheck(@store, value, formats, message)
  #   return @
  #
  #
  #
  # ### @Public ###
  # # 规则集验证
  # ##
  # rule: (name) =>
  #   for value in @values
  #     ruleCheck(@store, value, name)
  #   return @