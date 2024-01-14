import 'package:flutter/material.dart';
import 'package:test_task_make_it/core/extensions/string_extensions.dart';

class AddNewNotificationScreen extends StatelessWidget {
  const AddNewNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new notification'.hardcoded()),
      ),
    );
  }
}
