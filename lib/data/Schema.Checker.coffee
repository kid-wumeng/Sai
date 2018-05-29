isNil         = require('./isNil')
isBool        = require('./isBool')
isNumber      = require('./isNumber')
isString      = require('./isString')
isBuffer      = require('./isBuffer')
isDate        = require('./isDate')
isArray       = require('./isArray')
isObject      = require('./isObject')
isPlainObject = require('./isPlainObject')
mime          = require('./mime')



module.exports = class Checker



   constructor: ( opt = {} ) ->

      ########################################
      #|
      #|   @params {object} opt
      #|           {object} opt.rules   - {name: check(function)}
      #|           {object} opt.formats - {name: check(function)}
      #|           {*}      opt.data
      #|
      ########################################

      @_rules   = opt.rules
      @_formats = opt.formats
      @_data    = opt.data





   required: ( error ) =>

      ########################################
      #|
      #|   @params {*} error
      #|   @errors
      #|   @return {Checker} this
      #|
      ########################################

      if isNil(@_data)

         throw error ? "data.Schema.Checker.required >>>
                        Sorry, the data is required,
                        current is #{@_display(@_data)}."

      return @





   bool: ( error ) =>

      ########################################
      #|
      #|   @params {*} error
      #|   @errors
      #|   @return {Checker} this
      #|
      ########################################

      if @_data? and !isBool(@_data)

         throw error ? "data.Schema.Checker.bool >>>
                        Sorry, the data should be a bool,
                        current is #{@_display(@_data)}."

      return @





   number: ( error ) =>

      ########################################
      #|
      #|   @params {*} error
      #|   @errors
      #|   @return {Checker} this
      #|
      ########################################

      if @_data? and !isNumber(@_data)

         throw error ? "data.Schema.Checker.number >>>
                        Sorry, the data should be a number,
                        current is #{@_display(@_data)}."

      return @





   string: ( error ) =>

      ########################################
      #|
      #|   @params {*} error
      #|   @errors
      #|   @return {Checker} this
      #|
      ########################################

      if @_data? and !isString(@_data)

         throw error ? "data.Schema.Checker.string >>>
                        Sorry, the data should be a string,
                        current is #{@_display(@_data)}."

      return @





   buffer: ( error ) =>

      ########################################
      #|
      #|   @params {*} error
      #|   @errors
      #|   @return {Checker} this
      #|
      ########################################

      if @_data? and !isBuffer(@_data)

         throw error ? "data.Schema.Checker.buffer >>>
                        Sorry, the data should be a Buffer,
                        current is #{@_display(@_data)}."

      return @





   date: ( error ) =>

      ########################################
      #|
      #|   @params {*} error
      #|   @errors
      #|   @return {Checker} this
      #|
      ########################################

      if @_data? and !isDate(@_data)

         throw error ? "data.Schema.Checker.date >>>
                        Sorry, the data should be a Date,
                        current is #{@_display(@_data)}."

      return @





   array: ( error ) =>

      ########################################
      #|
      #|   @params {*} error
      #|   @errors
      #|   @return {Checker} this
      #|
      ########################################

      if @_data? and !isArray(@_data)

         throw error ? "data.Schema.Checker.array >>>
                        Sorry, the data should be an Array,
                        current is #{@_display(@_data)}."

      return @





   plainObject: ( error ) =>

      ########################################
      #|
      #|   @params {*} error
      #|   @errors
      #|   @return {Checker} this
      #|
      ########################################

      if @_data? and !isPlainObject(@_data)

         throw error ? "data.Schema.Checker.plainObject >>>
                        Sorry, the data should be a plain-object,
                        current is #{@_display(@_data)}."

      return @





   is: ( constructor, error ) =>

      ########################################
      #|
      #|   @params {Class} constructor
      #|   @params {*}     error
      #|   @errors
      #|   @return {Checker} this
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
      #|   @params {*[]} enums
      #|   @params {*}   error
      #|   @errors
      #|   @return {Checker} this
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
      #|   @params {number} min
      #|   @params {*}      error
      #|   @errors
      #|   @return {Checker} this
      #|
      ########################################

      if @_data?

         switch
            when isNumber(@_data) then @_min_number(min, error)
            when isString(@_data) then @_min_string(min, error)
            when isBuffer(@_data) then @_min_buffer(min, error)

      return @





   max: ( max, error ) =>

      ########################################
      #|
      #|   @params {number} max
      #|   @params {*}      error
      #|   @errors
      #|   @return {Checker} this
      #|
      ########################################

      if @_data?

         switch
            when isNumber(@_data) then @_max_number(max, error)
            when isString(@_data) then @_max_string(max, error)
            when isBuffer(@_data) then @_max_buffer(max, error)

      return @





   _min_number: ( min, error ) =>
      if @_data < min
         throw error ? "data.Schema.Checker._min_number >>>
                        Sorry, the number should be ≥ #{min},
                        current is #{@_data}."

   _max_number: ( max, error ) =>
      if @_data > max
         throw error ? "data.Schema.Checker._max_number >>>
                        Sorry, the number should be ≤ #{max},
                        current is #{@_data}."

   _min_string: ( min, error ) =>
      if @_data.length < min
         throw error ? "data.Schema.Checker._min_string >>>
                        Sorry, the string's length should be ≥ #{min},
                        current is #{@_data.length}."

   _max_string: ( max, error ) =>
      if @_data.length > max
         throw error ? "data.Schema.Checker._max_string >>>
                        Sorry, the string's length should be ≤ #{max},
                        current is #{@_data.length}."

   _min_buffer: ( min, error ) =>
      if @_data.length < min
         throw error ? "data.Schema.Checker._min_buffer >>>
                        Sorry, the buffer's length should be ≥ #{min},
                        current is #{@_data.length}."

   _max_buffer: ( max, error ) =>
      if @_data.length > max
         throw error ? "data.Schema.Checker._max_buffer >>>
                        Sorry, the buffer's length should be ≤ #{max},
                        current is #{@_data.length}."





   mime: ( mimes, error ) =>

      ########################################
      #|
      #|   @params {string[]} mimes
      #|   @params {*}        error
      #|   @errors
      #|   @return {Checker} this
      #|
      ########################################

      if @_data?

         mime = mime(@_data)

         if !mimes.includes(mime)

            mimes = mimes.map (m) => "'#{m}'"

            throw error ? "data.Schema.Checker.mime >>>
                           Sorry, the data's mime should be in #{mimes.join(', ')},
                           current is #{mime}."

      return @





   format: ( format, error ) =>

      ########################################
      #|
      #|   @params {string} format
      #|   @params {*}      error
      #|   @errors
      #|   @return {Checker} this
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
      #|   @params {string}  rule
      #|   @errors
      #|   @return {Checker} this
      #|
      ########################################

      check = @_rules[rule]

      if !check then throw "data.Schema.Checker.rule:
                            The rule { #{rule} } hasn't registered yet."

      try
         check(@_data)
         return @

      catch error
         if isString(error) then error += " <<< the rule { #{rule} }"
         throw error





   _display: ( data ) =>

      ########################################
      #|
      #|   Format the data for error's message.
      #|
      #|   @params {*} data
      #|   @return {string}
      #|
      ########################################

      switch
         when isBool(data)        then "{ " + data + " }"
         when isString(data)      then "'" + data + "'"
         when isArray(data)       then "[ " + data.join(', ') + " ]"
         when isPlainObject(data) then data
         when isObject(data)      then "< " + data.constructor.name + " >"
         else data