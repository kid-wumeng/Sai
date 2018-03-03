_        = require('lodash')
inspect  = require('util').inspect
fileType = require('file-type')
string   = require('../string')



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

      if @_data? and !_.isBoolean(@_data)

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

      if @_data? and !_.isFinite(@_data)

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

      if @_data? and !_.isString(@_data)

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

      if @_data? and !_.isBuffer(@_data)

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

      if @_data? and !_.isDate(@_data)

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

      if @_data? and !_.isArray(@_data)

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

      if @_data? and !_.isPlainObject(@_data)

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

      if @_data? and !( @_data instanceof constructor )

         throw error ? "data.Schema.Checker.is >>>
                        Sorry, the data should be a < #{constructor.name} >,
                        current data is #{@_display(@_data)}."

      return @





   in: ( enums, error ) =>

      ########################################
      #|
      #|  @params {*[]} enums
      #|  @params {*}   error
      #|  @errors
      #|  @return {Checker} this
      #|
      ########################################

      if @_data? and !enums.includes(@_data)

         enums = enums.map (e) => @_display(e)

         throw error ? "data.Schema.Checker.in >>>
                        Sorry, the data should be in #{enums.join(', ')},
                        current is #{@_display(@_data)}."

      return @





   min: ( min, error ) =>

      ########################################
      #|
      #|  @params {number} min
      #|  @params {*}      error
      #|  @errors
      #|  @return {Checker} this
      #|
      ########################################

      if @_data?

         switch
            when _.isNumber(@_data) then @_min_number(min)
            when _.isString(@_data) then @_min_string(min)
            when _.isBuffer(@_data) then @_min_buffer(min)

      return @





   max: ( max, error ) =>

      ########################################
      #|
      #|  @params {number} max
      #|  @params {*}      error
      #|  @errors
      #|  @return {Checker} this
      #|
      ########################################

      if @_data?

         switch
            when _.isNumber(@_data) then @_max_number(max)
            when _.isString(@_data) then @_max_string(max)
            when _.isBuffer(@_data) then @_max_buffer(max)

      return @





   _min_number: ( min ) =>
      if @_data < min
         throw error ? "data.Schema.Checker._min_number >>>
                        Sorry, the number should be ≥ #{min},
                        current is #{@_data}."

   _max_number: ( max ) =>
      if @_data > max
         throw error ? "data.Schema.Checker._max_number >>>
                        Sorry, the number should be ≤ #{max},
                        current is #{@_data}."

   _min_string: ( min ) =>
      if string.size(@_data) < min
         throw error ? "data.Schema.Checker._min_string >>>
                        Sorry, the string's size should be ≥ #{min},
                        current is #{string.size(@_data)}."

   _max_string: ( max ) =>
      if string.size(@_data) > max
         throw error ? "data.Schema.Checker._max_string >>>
                        Sorry, the string's size should be ≤ #{max},
                        current is #{string.size(@_data)}."

   _min_buffer: ( min ) =>
      if @_data.length < min
         throw error ? "data.Schema.Checker._min_buffer >>>
                        Sorry, the buffer's size should be ≥ #{min},
                        current is #{@_data.length}."

   _max_buffer: ( max ) =>
      if @_data.length > max
         throw error ? "data.Schema.Checker._max_buffer >>>
                        Sorry, the buffer's size should be ≤ #{max},
                        current is #{@_data.length}."





   mime: ( mimes, error ) =>

      ########################################
      #|
      #|  @params {string[]} mimes
      #|  @params {*}        error
      #|  @errors
      #|  @return {Checker} this
      #|
      ########################################

      if @_data?

         mime = fileType(@_data).mime

         if !mimes.includes(mime)

            mimes = mimes.map (m) => "'#{m}'"

            throw error ? "data.Schema.Checker.mime >>>
                           Sorry, the data's mime should be in #{mimes.join(', ')},
                           current is #{mime}."

      return @





   format: ( format, error ) =>

      ########################################
      #|
      #|  @params {string} format
      #|  @params {*}      error
      #|  @errors
      #|  @return {Checker} this
      #|
      ########################################

      check = @_formats[format]

      if !check then throw "data.Schema.Checker.format:
                            The format { #{format} } hasn't registered yet."

      if @_data and check(@_data) isnt true

         throw error ? "data.Schema.Checker.format >>>
                        Sorry, the data's format should be { #{format} },
                        current data is #{@_display(@_data)}."

      return @





   rule: ( rule ) =>

      ########################################
      #|
      #|  @params {string}  rule
      #|  @errors
      #|  @return {Checker} this
      #|
      ########################################

      check = @_rules[rule]

      if !check then throw "data.Schema.Checker.rule:
                            The rule { #{rule} } hasn't registered yet."

      try
         check(@_data)
         return @

      catch error
         if _.isString(error) then error += " <<< the rule { #{rule} }"
         throw error





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
         when _.isString(data)      then "'" + data + "'"
         when _.isArray(data)       then "[ " + data.join(', ') + " ]"
         when _.isPlainObject(data) then inspect(data)
         when _.isObject(data)      then "< " + data.constructor.name + " >"
         else data