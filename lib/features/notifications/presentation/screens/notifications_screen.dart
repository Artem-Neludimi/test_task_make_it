import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_task_make_it/core/extensions/string_extensions.dart';
import 'package:test_task_make_it/features/notifications/logic/controllers/notifications_controllers.dart';

import '../widgets/notification_tabs.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        Provider(
          create: (_) => NotificationControllers(),
          dispose: (_, value) => value.dispose(),
        ),
      ],
      child: DefaultTabController(
        length: 2,
        child: Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Notifications'.hardcoded()),
              bottom: NotificationsTabs(context),
            ),
            body: const _Body(),
          );
        }),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    context.read<NotificationControllers>().init(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controllers = context.read<NotificationControllers>();
    return TabBarView(
      controller: controllers.tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Container(
          child: const Center(
            child: Text('Tab 1 Content'),
          ),
        ),
        Container(
          child: const Center(
            child: Text('Tab 2 Content'),
          ),
        ),
      ],
    );
  }
}
