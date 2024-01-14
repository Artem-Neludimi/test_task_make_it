import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_make_it/core/extensions/context_extensions.dart';
import 'package:test_task_make_it/core/extensions/string_extensions.dart';
import 'package:test_task_make_it/features/notifications/logic/controllers/notifications_controllers.dart';

class NotificationsTabs extends PreferredSize {
  final BuildContext context;

  NotificationsTabs(
    this.context, {
    super.key,
  }) : super(
          preferredSize: const Size.fromHeight(70),
          child: SizedBox(
            height: 100,
            width: context.width,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const _Tabs(),
              ),
            ),
          ),
        );
}

class _Tabs extends StatelessWidget {
  const _Tabs();

  @override
  Widget build(BuildContext context) {
    final tabController = context.read<NotificationControllers>().tabController;
    return Padding(
      padding: const EdgeInsets.all(4),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ListenableBuilder(
            listenable: tabController,
            builder: (context, _) {
              final isFirstTab = tabController.index == 0;
              return Stack(
                children: [
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 120),
                    alignment: isFirstTab ? Alignment.centerLeft : Alignment.centerRight,
                    child: Container(
                      width: constraints.maxWidth / 2,
                      decoration: BoxDecoration(
                        color: context.colorScheme.onTertiary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Row(
                      children: [
                        _Tab(
                          index: 0,
                          isFirstTab: !isFirstTab,
                        ),
                        _Tab(
                          index: 1,
                          isFirstTab: isFirstTab,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({required this.index, required this.isFirstTab});
  final int index;
  final bool isFirstTab;

  @override
  Widget build(BuildContext context) {
    final tabController = context.read<NotificationControllers>().tabController;

    return Expanded(
      child: switch (index) {
        0 => GestureDetector(
            onTap: () => tabController.animateTo(0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.timer_outlined,
                  color: isFirstTab ? context.colorScheme.onPrimary : context.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'One-time'.hardcoded(),
                  style: context.textTheme.titleSmall!.copyWith(
                    color: isFirstTab ? context.colorScheme.onPrimary : context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        1 => GestureDetector(
            onTap: () => tabController.animateTo(1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.history_outlined,
                  color: isFirstTab ? context.colorScheme.onPrimary : context.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Recurring'.hardcoded(),
                  style: context.textTheme.titleSmall!.copyWith(
                    color: isFirstTab ? context.colorScheme.onPrimary : context.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
        _ => const SizedBox.shrink(),
      },
    );
  }
}
