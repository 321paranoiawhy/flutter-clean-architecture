import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'routes/go_router.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

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
      // 初始路由页: /Login
      // initialRoute: RoutesProvider().toLoginPage,
      // navigatorKey: RoutesProvider().navigatorKey,
      // navigatorObservers: [RoutesProvider().routeObserver],
      // onUnknownRoute: (RouteSettings settings) => MaterialPageRoute<void>(
      //   settings: settings,
      //   builder: (BuildContext context) => const NotFoundPage(),
      // ),
      // routes: RoutesProvider().routes,
      routerConfig: goRoutes,

      // onGenerateRoute: (RouteSettings settings) {
      //   final String? routeName = settings.name;
      //   print(routeName);

      //   if (routeName != null && routeName.startsWith('/user/')) {
      //     return MaterialPageRoute(
      //       builder: (BuildContext context) {
      //         return UserPage(
      //           id: Uri.parse(routeName).pathSegments.last,
      //         );
      //       },
      //     );
      //   }
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) {
      //       return const NotFoundPage();
      //     },
      //   );

      //   // late final WidgetBuilder builder;
      //   // // late final Widget Function(BuildContext context) builder;
      //   // if (routes[routeName] == null) {
      //   //   builder = routes[routeName]!;
      //   // } else {
      //   //   builder = (BuildContext context) => const NotFoundPage();
      //   // }

      //   // WidgetBuilder builder =
      //   //     routes[routeName] ?? (BuildContext context) => const NotFoundPage();

      //   // return MaterialPageRoute(builder: builder, settings: settings);
      // },

      // home: const Scaffold(
      //   body: Center(
      //     child: Text('Hello World!'),
      //   ),
      // ),
    );
  }
}
