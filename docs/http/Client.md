<api jade>
   item
      name url(path)
      type -> url
      desc 获取格式化后的 Url
   item
      name get(path, data, opt)
      type -> promise
      desc 发送 GET 请求
   item
      name post(path, data, opt)
      type -> promise
      desc 发送 POST 请求
   item
      name put(path, data, opt)
      type -> promise
      desc 发送 PUT 请求
   item
      name patch(path, data, opt)
      type -> promise
      desc 发送 PATCH 请求
   item
      name delete(path, data, opt)
      type -> promise
      desc 发送 DELETE 请求
</api>