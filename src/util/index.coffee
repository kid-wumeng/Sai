exports.ObservableObject = require('./ObservableObject')



exports.padStart = ( value, len, char ) ->

   ########################################
   #|
   #|  Padding the char to value's start.
   #|
   #|  eg:
   #|     padStart(7, 3, '0') => '007'
   #|     padStart(7, 3, ' ') => '  7'
   #|
   #|  @params {*}      value - will convert to string
   #|  @params {number} len   - expected overall-length
   #|  @params {string} char  - the monocase used to padding
   #|
   #|  @return {string}
   #|
   ########################################

   string = value.toString()

   count = len - string.length

   while count > 0
      string = char + string
      count--

   return string