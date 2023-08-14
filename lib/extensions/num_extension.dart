// ignore_for_file: unused_element
// https://github.com/jogboms/time.dart/blob/master/lib/src/extensions.dart#L3-L27

import 'package:flutter/cupertino.dart';

extension on num {
  /// Returns a Duration represented in weeks
  Duration get weeks => days * 7;

  /// Returns a Duration represented in days
  Duration get days => milliseconds * Duration.millisecondsPerDay;

  /// Returns a Duration represented in hours
  Duration get hours => milliseconds * Duration.millisecondsPerHour;

  /// Returns a Duration represented in minutes
  Duration get minutes => milliseconds * Duration.millisecondsPerMinute;

  /// Returns a Duration represented in seconds
  Duration get seconds => milliseconds * Duration.millisecondsPerSecond;

  /// Returns a Duration represented in milliseconds
  Duration get milliseconds => Duration(
      microseconds: (this * Duration.microsecondsPerMillisecond).toInt());

  /// Returns a Duration represented in microseconds
  Duration get microseconds =>
      milliseconds ~/ Duration.microsecondsPerMillisecond;

  /// Returns a Duration represented in nanoseconds
  Duration get nanoseconds => microseconds ~/ 1000;

  /// 水平间距
  SizedBox get horizontal => SizedBox(width: toDouble());

  /// 垂直间距
  SizedBox get vertical => SizedBox(height: toDouble());
}
