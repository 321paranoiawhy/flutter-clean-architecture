import 'package:flutter/material.dart';

// class Fade<T> extends PageRouteBuilder<T> {}

class Fade<T> extends PageRouteBuilder<T> {
  final Widget page;

  Fade({required this.page, required super.settings})
      : super(
          transitionDuration: const Duration(milliseconds: 700),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (BuildContext context, Animation<double> animation1,
                  Animation<double> animation2) =>
              page,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation1,
              Animation<double> animation2,
              Widget page) {
            final CurvedAnimation curvedAnimation =
                CurvedAnimation(parent: animation1, curve: Curves.ease);
            return FadeTransition(
              opacity:
                  Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
              child: page,
            );
          },
        );
}
