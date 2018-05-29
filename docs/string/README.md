<api jade>
   item
      name len(string, mode)
      type -> len
      desc 计算字符串的长度，可选的计算模式：'length', 'cjk', 'utf8'
   item
      name padEnd(value, len, char)
      type -> string
      desc 填补并对齐字符串的尾部
   item
      name padStart(value, len, char)
      type -> string
      desc 填补并对齐字符串的头部
</api>