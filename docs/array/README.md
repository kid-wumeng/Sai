<api jade>
   item
      name count(items, callback)
      type -> count
      desc 统计符合 callback 结果的 item 数量
</api>





# 方法

## count

原型：`count( items, callback ) -> count`

<api jade>
   item
      name items
      type \*[]
   item
      name callback(item) -> bool
      type function
      desc 判断 item 是否符合要求
   item
      name -> count
      type number
      desc 符合要求的 item 数量
</api>