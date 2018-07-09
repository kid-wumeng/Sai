module.exports = len = ( string, mode = 'length' ) =>

   ########################################
   #|
   #|   @params {string} string
   #|   @params {string} mode
   #|
   #|   @errors
   #|
   #|   @return {number} len
   #|
   ########################################

   switch mode

      when 'length' then string.length
      when 'cjk'    then _cjk( string )
      when 'utf8'   then _utf8( string )

      else throw "string.len >>>
                  The { #{mode} } is not a invalid mode."





_cjk = ( string ) =>

   ########################################
   #|
   #|   @params {string}
   #|   @return {number} len
   #|
   ########################################

   len = 0

   for char in string

      if char.charCodeAt(0) <= 127
         len += 1
      else
         len += 2

   return len





_utf8 = ( string ) =>

   ########################################
   #|
   #|   @params {string}
   #|   @errors
   #|   @return {number} len
   #|
   ########################################

   len = 0

   for char in string

      code = char.charCodeAt(0)

      switch code
         when code <= 127     then len += 1  # \x0000  - \x007F
         when code <= 2047    then len += 2  # \x0080  - \x07FF
         when code <= 65535   then len += 3  # \x0800  - \xFFFF
         when code <= 2097151 then len += 4  # \x10000 - \x1FFFFF
         else
            throw "string._utf8 >>>
                   The character { #{char} } is beyond the unicode set."

   return len