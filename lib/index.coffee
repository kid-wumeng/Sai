module.exports =

   # ~core
   type: require('./core/type')

   # ~is
   is:              require('./is/is')
   isBoolean:       require('./is/isBoolean')
   isNumber:        require('./is/isNumber')
   isInt:           require('./is/isInt')
   isN:             require('./is/isN')
   isID:            require('./is/isID')
   isString:        require('./is/isString')
   isSymbol:        require('./is/isSymbol')
   isFunction:      require('./is/isFunction')
   isAsyncFunction: require('./is/isAsyncFunction')
   isArray:         require('./is/isArray')
   isArrayLike:     require('./is/isArrayLike')
   isNaN:           require('./is/isNaN')