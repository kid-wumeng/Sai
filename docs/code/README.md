<api jade>
   item
      name bcrypt.compare(data, hash)
      type -> bool
      desc 使用 Bcrypt 比对数据与哈希是否匹配
   item
      name bcrypt.encode(data)
      type -> hash
      desc 使用 Bcrypt 加密
   item
      name jwt.decode(token, secret)
      type -> payload
      desc 使用 JWT 解密
   item
      name jwt.encode(payload, secret, maxAge)
      type -> token
      desc 使用 JWT 加密
</api>





# 方法

## bcrypt.compare

原型：`bcrypt.compare( data, hash ) -> isMatched`

<api jade>
   item
      name data
      type string
      desc 未加密的数据
   item
      name hash
      type string
      desc 已加密的哈希
   item
      name -> isMatched
      type boolean
      desc 数据与哈希是否匹配
</api>





## bcrypt.encode

原型：`bcrypt.encode( data ) -> hash`

<api jade>
   item
      name data
      type string
      desc 未加密的数据
   item
      name -> hash
      type string
      desc 已加密的哈希
</api>





## jwt.decode

原型：`jwt.decode( token, secret ) -> payload`

<api jade>
   item
      name token
      type string
      desc 已加密的令牌
   item
      name secret
      type string
      desc 密钥
   item
      name -> payload
      type object
      desc 有效荷载（自定义数据）
</api>





## jwt.encode

原型：`jwt.encode( payload, secret, maxAge ) -> token`

<api jade>
   item
      name payload
      type object
      desc 有效荷载（自定义数据）
   item
      name secret
      type string
      desc 密钥
   item
      name maxAge
      type number
      desc 可存活多久（秒）
   item
      name -> token
      type string
      desc 加密后的令牌
</api>