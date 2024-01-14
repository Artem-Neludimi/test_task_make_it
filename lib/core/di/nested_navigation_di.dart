import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_make_it/features/notifications/logic/notifications/notifications_bloc.dart';

class NotificationsDi extends StatelessWidget {
  const NotificationsDi({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsBloc(),
      child: child,
    );
  }
}
