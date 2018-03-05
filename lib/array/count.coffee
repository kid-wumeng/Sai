module.exports = count = ( items, callback ) =>

   ########################################
   #|
   #|  @params {*[]}      items
   #|  @params {function} callback(item)
   #|
   #|  @return {number}   count
   #|
   ########################################

   count = 0

   for item in items
      if callback(item)
         count++

   return count