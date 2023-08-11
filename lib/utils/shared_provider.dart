import 'package:flutter/material.dart';

class LoginStateWidget extends InheritedWidget {
  /// 是否已登录
  final bool isLogin;

  const LoginStateWidget(
      {required this.isLogin, required Widget child, Key? key})
      : super(key: key, child: child);

  static LoginStateWidget of(BuildContext context) {
    // context.getElementForInheritedWidgetOfExactType();
    final LoginStateWidget? result =
        context.dependOnInheritedWidgetOfExactType<LoginStateWidget>();
    assert(result != null, 'Can not find LoginStateWidget in context');
    return result!;
  }

  static LoginStateWidget? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<LoginStateWidget>();
  }

  @override
  bool updateShouldNotify(covariant LoginStateWidget oldWidget) {
    return oldWidget.isLogin == isLogin;
  }
}
