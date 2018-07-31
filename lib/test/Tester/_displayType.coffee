module.exports = ( type ) ->

   ########################################
   #|
   #|   @params {*}      type
   #|   @return {string} type
   #|
   ########################################

   return type?.name ? "#{type}"