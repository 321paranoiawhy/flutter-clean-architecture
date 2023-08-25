// ignore_for_file: unused_element

const List<int> leapYearMonths = [1, 3, 5, 7, 8, 10, 12];

extension on DateTime {
  /// 在当年中的第几天
  int daysInYear() => difference(DateTime(year, 1, 1)).inDays;

  /// 在当年中的第几周
  int weeksInYear() => daysInYear() ~/ 7;

  /// 在当月中的第几天
  int daysInMonth() => difference(DateTime(year, month, 1)).inDays;

  /// 当月有多少天
  int totalDaysInMonth() {
    // 另一种方式, 直接计算下一个月前一天即可
    // return DateTime(year, month + 1, 0).day;

    // 1 3 5 7 8 10 12 每月固定 31 天
    if (leapYearMonths.contains(month)) {
      return 31;
      // 特殊的 2 月
    } else if (month == 2) {
      // 闰年, 2 月有 29 天
      // 非闰年, 2 月有 28 天
      return isLeapYear ? 29 : 28;
    }
    // 余者, 30 天
    return 30;
  }

  bool get isLeapYear => _isLeapYear();

  /// 是否为闰年
  bool _isLeapYear() {
    // Leap years are used since 1582.
    if (year < 1582) {
      return false;
    }

    return (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;
  }

  /// 是否为同一天
  bool isSameDate(DateTime other) {
    // 年月日都相同即为同一天
    return year == other.year && month == other.month && day == other.day;
  }

  /// 两日期之间相隔多少天
  int daysBetween(DateTime other) {
    return other.difference(this).inDays;
  }

  /// 是否是今天
  // bool get isToday => isSameDate(DateTime.now());
  bool get isToday => daysBetween(DateTime.now()) == 0;

  /// 是否为昨天
  bool get isYesterday => daysBetween(DateTime.now()) == -1;

  /// 是否为明天
  bool get isTomorrow => daysBetween(DateTime.now()) == 1;
}
