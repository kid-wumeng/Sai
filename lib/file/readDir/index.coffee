path_    = require('path')
fs       = require('fs-extra-promise')
errors   = require('../../errors')
error    = require('../../core/error')
isString = require('../../is/isString')
isObject = require('../../is/isObject')
isDir    = require('../isDir')


module.exports = ( path, options = {} ) ->


   ########################################
   #|
   #|   @params {string} path
   #|   @return {buffer} file
   #|
   ########################################


   if !isString( path )
      throw error({ name: errors.INVALID_PARAMS, message: "`path` should be a string" })


   if options? and !isObject( options )
      throw error({ name: errors.INVALID_PARAMS, message: "`options` should be an object" })


   mode = options?.mode ? 'path'


   if !['path', 'name', 'data', 'stat'].includes(mode)
      throw error({ name: errors.INVALID_PARAMS, message: "`options.mode` should be in ['path', 'name', 'data', 'stat']" })


   if !(await isDir( path ))
      throw error({ name: errors.DIR_NOT_FOUND, message: "`#{path}` not found or isn't a directory" })


   children = await fs.readdirAsync( path )


   if mode is 'path'
      return children.map (child) => getPath(child, path)

   if mode is 'name'
      return children

   if mode is 'data'
      return children.map (child) =>
         path: getPath(child, path)
         name: getName(child)
         base: getBase(child)
         ext:  getExt(child)
         dir:  getDir(child, path)

   if mode is 'stat'
      newChildren = []
      for child in children
          newChildren.push({
             path: getPath(child, path)
             name: getName(child)
             base: getBase(child)
             ext:  getExt(child)
             dir:  getDir(child, path)
             stats: await fs.statAsync(getPath(child, path))
          })
      return newChildren



getPath = ( child, path ) => path_.resolve( path, child )
getName = ( child )       => child
getBase = ( child )       => path_.basename(child, getExt(child))
getExt  = ( child )       => path_.extname(child)
getDir  = ( child, path ) => path_.dirname(getPath(child, path))