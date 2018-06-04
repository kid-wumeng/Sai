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
      @_name    = ''





   name: ( name ) =>

      ########################################
      #|
      #|   @params {string}  name
      #|   @return {Checker} this
      #|
      ########################################

      @_name = name

      return @





   required: ( error ) =>

      ########################################
      #|
      #|   @params {*} error
      #|   @errors
      #|   @return {Checker} this
      #|
      ########################################

      if isNil(@_data)

         error ?= "Sorry, the #{@_displayName()} is required"

         throw new Error(error)

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

         error ?= "Sorry, the #{@_displayName()} should be a bool,
                   current is #{@_displayData()}"

         throw new Error(error)

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

         error ?= "Sorry, the #{@_displayName()} should be a number,
                   current is #{@_displayData()}"

         throw new Error(error)

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

         error ?= "Sorry, the #{@_displayName()} should be a string,
                   current is #{@_displayData()}"

         throw new Error(error)

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

         error ?= "Sorry, the #{@_displayName()} should be a Buffer,
                   current is #{@_displayData()}"

         throw new Error(error)

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

         error ?= "Sorry, the #{@_displayName()} should be a Date,
                   current is #{@_displayData()}"

         throw new Error(error)

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

         error ?= "Sorry, the #{@_displayName()} should be an Array,
                   current is #{@_displayData()}"

         throw new Error(error)

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

         error ?= "Sorry, the #{@_displayName()} should be a plain-object,
                   current is #{@_displayData()}"

         throw new Error(error)

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

         error ?= "Sorry, the #{@_displayName()} should be a < #{constructor.name} >,
                   current is #{@_displayData()}"

         throw new Error(error)

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

         enums = enums.map (e) => @_displayData(e)

         error ?= "Sorry, the #{@_displayName()} should be in #{enums.join(', ')},
                   current is #{@_displayData()}"

         throw new Error(error)

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

         error ?= "Sorry, the #{@_displayName()} should be ≥ #{min},
                   current is #{@_data}"

         throw new Error(error)





   _max_number: ( max, error ) =>

      if @_data > max

         error ?= "Sorry, the #{@_displayName()} should be ≤ #{max},
                   current is #{@_data}"

         throw new Error(error)





   _min_string: ( min, error ) =>

      if @_data.length < min

         error ?= "Sorry, the #{@_displayName()} length should be ≥ #{min},
                   current is #{@_data.length}"

         throw new Error(error)





   _max_string: ( max, error ) =>

      if @_data.length > max

         error ?= "Sorry, the #{@_displayName()} length should be ≤ #{max},
                   current is #{@_data.length}"

         throw new Error(error)





   _min_buffer: ( min, error ) =>

      if @_data.length < min

         error ?= "Sorry, the #{@_displayName()} length should be ≥ #{min},
                   current is #{@_data.length}"

         throw new Error(error)





   _max_buffer: ( max, error ) =>

      if @_data.length > max

         error ?= "Sorry, the #{@_displayName()} length should be ≤ #{max},
                   current is #{@_data.length}"

         throw new Error(error)





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

            error ?= "Sorry, the #{@_displayName()} MIME should be in #{mimes.join(', ')},
                      current is #{mime}"

            throw new Error(error)

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

      if @_data?


         check = @_formats[format]


         if !_.isFunction(check)
            throw new Error("The format '#{format}' hasn't registered yet")


         if check(@_data) isnt true

            error ?= "Sorry, the #{@_displayName()} format should be '#{format}',
                      current is #{@_displayData()}"

            throw new Error(error)


      return @





   check: ( check, error ) =>

      ########################################
      #|
      #|   @params {function} check
      #|   @params {*}        error
      #|   @errors
      #|   @return {Checker}  this
      #|
      ########################################

      if !_.isFunction(check)

         throw new Error("The check isn't a function")


      if check(@_data) isnt true

         error ?= "Sorry, the #{@_displayName()} check fail"

         throw new Error(error)


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

      if _.isFunction(check)
         check(@_data)

      else
         throw new Error("The rule '#{rule}' hasn't registered yet")

      return @





   _displayName: =>

      ########################################
      #|
      #|   Format the name for error's message.
      #|
      #|   @return {string} displayName
      #|
      ########################################

      name = @_name

      if name
         return "'" + name + "'"
      else
         return "data"





   _displayData: =>

      ########################################
      #|
      #|   Format the data for error's message.
      #|
      #|   @return {string} displayData
      #|
      ########################################

      data = @_data

      switch
         when isBool(data)        then "{ " + data + " }"
         when isString(data)      then "'" + data + "'"
         when isArray(data)       then "[ " + data.join(', ') + " ]"
         when isPlainObject(data) then data
         when isObject(data)      then "< " + data.constructor.name + " >"
         else data