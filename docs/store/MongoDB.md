<api jade>
   item
      name await connect()
      desc 链接数据库
   item
      name await clone()
      desc 关闭链接
   item
      name await drop()
      desc 销毁数据库 ( 危险！ )
   item
      name hide(col, key)
      type -> (this)
      desc 隐藏某个集合的某个字段
   item
      name col(name)
      type -> collection
      desc 返回一个 MongoDB.Collection 对象
</api>