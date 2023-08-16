import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'routes/go_router.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

import 'widgets/page_route_transition/no_transitions_builder.dart';

void main() {
  // 使用 PathUrlStrategy
  // https://flutter.cn/docs/development/ui/navigation/url-strategies#configuring-the-url-strategy
  // if(Platform.is)
  if (kIsWeb) {
    usePathUrlStrategy();
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: goRoutes,
      theme: ThemeData(
        // https://code-on-the-rocks.web.app/tips/no-transitions/
        pageTransitionsTheme: PageTransitionsTheme(
          builders: kIsWeb
              ? {
                  for (final platform in TargetPlatform.values)
                    platform: const NoTransitionsBuilder(),
                }
              : {
                  TargetPlatform.android: const ZoomPageTransitionsBuilder(),
                  TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
                },
        ),
      ),
    );
  }
}
