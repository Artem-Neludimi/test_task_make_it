import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:test_task_make_it/core/di/nested_navigation_di.dart';
import 'package:test_task_make_it/features/auth/presentation/screens/login_screen.dart';
import 'package:test_task_make_it/features/notifications/presentation/screens/add_new_notification.dart';
import 'package:test_task_make_it/features/notifications/presentation/screens/notifications_screen.dart';

import '../../features/splash/splash_screen.dart';

final _routerKey = GlobalKey<NavigatorState>();
final _notificationsKey = GlobalKey<NavigatorState>();

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
    ShellRoute(
      navigatorKey: _notificationsKey,
      builder: (context, state, child) => NotificationsDi(child: child),
      routes: [
        GoRoute(
          parentNavigatorKey: _notificationsKey,
          path: AppRoute.notifications.path,
          builder: (context, state) => const NotificationsScreen(),
        ),
        GoRoute(
          parentNavigatorKey: _notificationsKey,
          path: AppRoute.addNewNotification.path,
          builder: (context, state) => const AddNewNotificationScreen(),
        ),
      ],
    ),
  ],
);

enum AppRoute {
  splash('/'),
  login('/login'),
  notifications('/notifications'),
  addNewNotification('/add-new-notification'),
  ;

  const AppRoute(this.path);

  final String path;
}

extension AppRouteNavigation on AppRoute {
  void go(BuildContext context, {extra}) => context.go(path, extra: extra);

  Future<T?> push<T>(BuildContext context, {extra}) => context.push<T>(path, extra: extra);
}
