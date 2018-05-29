<api jade>
   item
      name get(data, path, default)
      type -> value
      desc 从对象中取值（支持嵌套对象）
   item
      name isArray(data)
      type -> bool
      desc 是否数组
   item
      name isBool(data)
      type -> bool
      desc 是否布尔
   item
      name isBuffer(data)
      type -> bool
      desc 是否Buffer对象
   item
      name isDate(data)
      type -> bool
      desc 是否Date对象
   item
      name isNil(data)
      type -> bool
      desc 是否不存在的值（undefined 或 null）
   item
      name isNumber(data)
      type -> bool
      desc 是否数字
   item
      name isObject(data)
      type -> bool
      desc 是否对象
   item
      name isPlainObject(data)
      type -> bool
      desc 是否纯对象（字面量对象）
   item
      name isString(data)
      type -> bool
      desc 是否字符串
   item
      name mime(date)
      type -> 'image/png'
      desc 获取 Buffer 或 Uint8Array 的 MIME 值
</api>