errors = require('../../errors')
error  = require('../../core/error')
isDate = require('../../is/isDate')


module.exports = class Duration


   constructor: ( from, to ) ->


      ########################################
      #|
      #|   @params {sai.mongo.DB} db
      #|   @params {string}       name
      #|
      #|   @return {sai.mongo.Duration}
      #|
      ########################################


      if !isDate(from)
         throw error({ name: errors.INVALID_PARAMS, message: "`from` should be a Date" })

      if !isDate(to)
         throw error({ name: errors.INVALID_PARAMS, message: "`to` should be a Date" })

      if from.getTime() > to.getTime()
         throw error({ name: errors.INVALID_PARAMS, message: "`from` should be ≤ `to`" })


      @_from = from
      @_to   = to


      @allYears        = require('./@allYears')
      @allMonths       = require('./@allMonths')
      @allDays         = require('./@allDays')
      @allHours        = require('./@allHours')
      @allMinutes      = require('./@allMinutes')
      @allSeconds      = require('./@allSeconds')
      @allMilliSeconds = require('./@allMilliSeconds')

      # @milliSeconds    = require('./@milliSeconds')
      # @seconds         = require('./@seconds')
      # @minutes         = require('./@minutes')
      # @hours           = require('./@hours')
      # @years           = require('./@years')