exports.year    = require('./year')
exports.month   = require('./month')
exports.day     = require('./day')
exports.hour    = require('./hour')
exports.minute  = require('./minute')
exports.second  = require('./second')
exports.ms      = require('./ms')

exports.week    = require('./week')
exports.stamp   = require('./stamp')

exports.date    = require('./date')
exports.format  = require('./format')

exports.between = require('./between')
exports.from    = require('./from')
exports.to      = require('./to')





# exports.displayDate = (date) ->
#
#    duration = time.from(date)
#
#    switch
#       when duration.mss     <= 0  then "刚刚"
#       when duration.seconds <= 60 then "#{duration.seconds}秒前"
#       when duration.minutes <= 60 then "#{duration.minutes}分钟前"
#       when duration.hours   <= 24 then "#{duration.hours}小时前"
#       when duration.days    <= 5  then "#{duration.days}天前"
#
#       else time.format(date, 'YYYY-MM-DD')
#
#
# "还剩下#{duration.minute}分#{duration.second}秒#{duration.ms}毫秒"