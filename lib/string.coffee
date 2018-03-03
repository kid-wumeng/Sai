isEmail = require('validator/lib/isEmail')
isURL   = require('validator/lib/isURL')



exports.size = ( string ) =>

   ########################################
   #|
   #|  @params {string}
   #|  @return {number} len
   #|
   ########################################

   len = 0

   for char in string

      if /[^\x00-\xff]/.test(char)
         len += 2
      else
         len += 1

   return len





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





exports.padEnd = ( value, len, char ) ->

   ########################################
   #|
   #|  Padding the char to value's end.
   #|
   #|  eg:
   #|     padStart(7, 3, '0') => '700'
   #|     padStart(7, 3, ' ') => '7  '
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
      string = string + char
      count--

   return string





exports.isEmail = isEmail

   ########################################
   #|
   #|  @params {string}
   #|  @return {bool}
   #|
   ########################################





exports.isURL = isURL

   ########################################
   #|
   #|  @params {string}
   #|  @return {bool}
   #|
   ########################################