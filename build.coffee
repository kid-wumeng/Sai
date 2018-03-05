child_process = require('child_process')
fs            = require('fs-extra-promise')
path          = require('path')
webpack       = require('webpack')
colors        = require('colors')





clear = =>

   await fs.removeAsync(__dirname + '/dist')





compile = =>

   file = './node_modules/.bin/coffee'

   args = ['-c', '-o', 'dist/', 'lib/']

   return new Promise ( resolve, reject ) =>

      child_process.execFile file, args, ( error, stdout, stderr ) =>

         if error
            reject(error)
         else
            console.log stdout
            console.log stderr
            console.log 'all compiled.'.green
            resolve()





pack = ( name, min = false ) =>


   if min
      mode = "production"
      file = "Sai.#{name}.min.js"
   else
      mode = "development"
      file = "Sai.#{name}.js"


   config =

      mode: mode

      entry: "./dist/index.#{name}.js"

      output:
         path:          path.resolve(__dirname, 'dist')
         filename:      file
         library:       'Sai'
         libraryTarget: 'umd'


   return new Promise ( resolve, reject ) =>

      webpack config, ( error, stats ) =>

         if error
            reject(error)

         else

            info = stats.toJson()

            if stats.hasErrors()
               console.error(info.errors)

            if stats.hasWarnings()
               console.warn(info.warnings)

            console.log "#{file} packed.".green
            resolve()





do =>

   try

      await clear()
      await compile()
      await pack('web')
      await pack('web', true)
      await pack('web-lite')
      await pack('web-lite', true)

   catch error
      console.log error