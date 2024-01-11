import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task_make_it/features/auth/presentation/login_screen.dart';

import '../../features/splash/splash_screen.dart';

final _routerKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _routerKey,
  routes: [
    GoRoute(
      parentNavigatorKey: _routerKey,
      path: AppRoute.splash.path,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      parentNavigatorKey: _routerKey,
      path: AppRoute.login.path,
      builder: (context, state) => const LoginScreen(),
    ),
  ],
);

enum AppRoute {
  splash('/'),
  login('/login'),
  ;

  const AppRoute(this.path);

  final String path;
}

extension AppRouteNavigation on AppRoute {
  void go(BuildContext context, {extra}) => context.go(path, extra: extra);

  Future<T?> push<T>(BuildContext context, {extra}) => context.push<T>(path, extra: extra);
}
