<api jade>
   item
      name between(start, end)
      type -> { days, hours, minutes, seconds, mss }
      desc 计算从 start 到 end 之间的时段
   item
      name date(year, month, day, hour, minute, second, ms)
      type -> date
      desc 创建一个 Date 对象，月份从 1 开始
   item
      name day(date)
      type -> 1 - 31
      desc 获取日期
   item
      name format(date, format)
      type -> string
      desc 格式化日期字符串
   item
      name from(start)
      type -> { days, hours, minutes, seconds, mss }
      desc 计算从 start 到当前之间的时段
   item
      name hour(date)
      type -> 0 - 23
      desc 获取小时
   item
      name minute(date)
      type -> 0 - 59
      desc 获取分钟
   item
      name month(date)
      type -> 1 - 12
      desc 获取月份
   item
      name ms(date)
      type -> 0 - 999
      desc 获取毫秒
   item
      name second(date)
      type -> 0 - 59
      desc 获取秒
   item
      name stamp(date)
      type -> stamp
      desc 获取时间戳
   item
      name to(end)
      type -> { days, hours, minutes, seconds, mss }
      desc 计算从当前到 end 之间的时段
   item
      name week(date)
      type -> 0 - 6
      desc 获取星期，星期天 - 星期六
   item
      name year(date)
      type -> year
      desc 获取年份
</api>