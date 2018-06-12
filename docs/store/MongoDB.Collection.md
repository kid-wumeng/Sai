<api jade>
   item
      name await findOne(query, opt)
      type -> doc | null
      desc 查找单个文档
   item
      name await find(query, opt)
      type -> docs
      desc 查找多个文档
   item
      name await count(query, opt)
      type -> count
      desc 查找符合条件的文档数量
   item
      name await insertOne(doc)
      type -> { \_id, id, createDate }
      desc 插入单个文档
   item
      name await insertMany(docs)
      type -> [{ \_id, id, createDate }]
      desc 插入多个文档
   item
      name await findOneAndUpdate(query, modifier)
      type -> newDoc
      desc 更新并返回文档
   item
      name await updateOne(query, modifier)
      type -> modifiedCount
      desc 更新单个文档，返回成功更新的文档数量
   item
      name await updateMany(query, modifier)
      type -> modifiedCount
      desc 更新多个文档，返回成功更新的文档数量
   item
      name await deleteOne(query)
      type -> deletedCount
      desc 删除单个文档，返回成功删除的文档数量
   item
      name await deleteMany(query)
      type -> deletedCount
      desc 删除多个文档，返回成功删除的文档数量
   item
      name await aggregate(pipeline, opt)
      type -> results
      desc 聚合管道操作
</api>