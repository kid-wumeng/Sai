<api jade>
   item
      name required(error)
      type -> (this)
      desc 是否存在 ( 不为空 )
   item
      name bool(error)
      type -> (this)
      desc 是否为布尔
   item
      name number(error)
      type -> (this)
      desc 是否为数字
   item
      name string(error)
      type -> (this)
      desc 是否为字符串
   item
      name buffer(error)
      type -> (this)
      desc 是否为Buffer
   item
      name date(error)
      type -> (this)
      desc 是否为Date
   item
      name array(error)
      type -> (this)
      desc 是否为数组
   item
      name plainObject(error)
      type -> (this)
      desc 是否为纯对象
   item
      name is(constructor, error)
      type -> (this)
      desc 是否属于某个类
   item
      name in(enums, error)
      type -> (this)
      desc 是否为给定的枚举值之一
   item
      name min(min, error)
      type -> (this)
      desc 是否 ≥ 某值
   item
      name max(max, error)
      type -> (this)
      desc 是否 ≤ 某值
   item
      name mime(mimes, error)
      type -> (this)
      desc 是否为给定的 MIME 值之一
   item
      name format(format, error)
      type -> (this)
      desc 是否符合某个格式
   item
      name rule(rule, error)
      type -> (this)
      desc 是否符合某个规则
</api>