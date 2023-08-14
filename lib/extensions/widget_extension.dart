// ignore_for_file: unused_element

import 'package:flutter/cupertino.dart';

extension on Widget {
  /// paddingLeft
  Padding paddingLeft(double left, {Key? key}) =>
      Padding(key: key, padding: EdgeInsets.only(left: left), child: this);

  /// paddingRight
  Padding paddingRight(double right, {Key? key}) =>
      Padding(key: key, padding: EdgeInsets.only(right: right), child: this);

  /// paddingTop
  Padding paddingTop(double top, {Key? key}) =>
      Padding(key: key, padding: EdgeInsets.only(top: top), child: this);

  /// paddingBottom
  Padding paddingBottom(double bottom, {Key? key}) =>
      Padding(key: key, padding: EdgeInsets.only(bottom: bottom), child: this);

  /// paddingOnly
  Padding paddingOnly(
          {double left = 0.0,
          double right = 0.0,
          double top = 0.0,
          double bottom = 0.0,
          Key? key}) =>
      Padding(
          key: key,
          padding: EdgeInsets.only(
              left: left, right: right, top: top, bottom: bottom),
          child: this);
}
