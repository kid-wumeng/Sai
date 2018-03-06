childProcess = require('child_process')
fs            = require('fs-extra-promise')
path          = require('path')
bluebird      = require('bluebird')
webpack       = require('webpack')
colors        = require('colors')



root     = path.dirname( __dirname )
webpack  = bluebird.promisify( webpack )
execFile = bluebird.promisify( childProcess.execFile )



clear = =>

   ########################################
   #|
   #|  Remove the whole /dist.
   #|
   #|  @async-function
   #|
   ########################################

   await fs.removeAsync(root + '/dist')





compile = =>

   ########################################
   #|
   #|  Compile the /lib/**.coffee to /dist/**.js
   #|
   #|  @async-function
   #|
   ########################################

   await execFile('coffee', ['-c', '-o', 'dist/', 'lib/'])

   console.log 'all compiled.'.green





config = ( name, min = false ) =>

   ########################################
   #|
   #|  Ready the webpack's config.
   #|
   #|  @async-function
   #|
   #|  @params {string} name
   #|  @params {bool}   min
   #|
   #|  @return {object} config
   #|
   ########################################

   entry = "#{root}/dist/index.#{name}.js"

   if min
      mode = "production"
      file = "Sai.#{name}.min.js"
   else
      mode = "development"
      file = "Sai.#{name}.js"

   output =
      path:     root + '/dist'
      filename: file
      library:       'Sai'
      libraryTarget: 'umd'

   return { entry, mode, output }





pack = ( config ) =>

   ########################################
   #|
   #|  Pack web's code by webpack.
   #|
   #|  eg:
   #|     entry = /dist/index.web-lite.js
   #|
   #|     => /dist/Sai.web-lite.js
   #|     => /dist/Sai.web-lite.min.js
   #|
   #|  @async-function
   #|
   #|  @params {object} config
   #|
   ########################################

   await webpack(config)

   console.log "#{config.output.filename} packed.".green





do =>

   try

      await clear()
      await compile()

      await pack(config('web'))
      await pack(config('web', true))

      await pack(config('web-lite'))
      await pack(config('web-lite', true))

   catch error
      console.log error