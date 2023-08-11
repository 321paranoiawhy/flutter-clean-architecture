import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../pages/home_page.dart';

// GoRouter configuration
final GoRouter goRoutes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    // GoRoute(
    //   path: RoutesProvider().toLoginPage,
    //   builder: (BuildContext context, GoRouterState state) => const LoginPage(),
    // ),
    // GoRoute(
    //   path: RoutesProvider().toHomePage,
    //   builder: (BuildContext context, GoRouterState state) => const HomePage(),
    // ),
    // GoRoute(
    //   path: '/user/:userId',
    //   builder: (BuildContext context, GoRouterState state) => UserPage(
    //     id: state.pathParameters['userId']!,
    //     filter: Filter.all,
    //   ),
    // ),
    // GoRoute(
    //   path: '/user',
    //   builder: (context, state) =>
    //       const UserPage(filter: state.queryParameters['filter']!),
    // ),
  ],
);
