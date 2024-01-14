import 'package:flutter/material.dart';
import 'package:test_task_make_it/core/extensions/string_extensions.dart';
import 'package:test_task_make_it/core/navigation/app_router.dart';

class FirstTabView extends StatelessWidget {
  const FirstTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 52,
            width: double.infinity,
            child: _AddButton(),
          ),
        ],
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        AppRoute.addNewNotification.push(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add_circle),
          const SizedBox(width: 8),
          Text('Add new notification'.hardcoded()),
        ],
      ),
    );
  }
}
