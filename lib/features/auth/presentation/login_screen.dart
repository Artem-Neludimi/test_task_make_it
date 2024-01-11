import 'package:flutter/material.dart';
import 'package:test_task_make_it/core/extensions/context_extensions.dart';
import 'package:test_task_make_it/core/extensions/string_extensions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Log In'.hardcoded()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Log In'.hardcoded(), style: context.textTheme.headlineMedium),
            Text('Enter current time in hh : mm format'.hardcoded(), style: context.textTheme.labelMedium),
          ],
        ),
      ),
    );
  }
}
