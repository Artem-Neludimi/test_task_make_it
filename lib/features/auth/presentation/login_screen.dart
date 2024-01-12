import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_make_it/core/extensions/context_extensions.dart';
import 'package:test_task_make_it/core/extensions/string_extensions.dart';
import 'package:test_task_make_it/features/auth/logic/auth_timer/auth_timer_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthTimerBloc(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text('Log In'.hardcoded()),
        ),
        body: const _Body(),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 80),
          Text('Log In'.hardcoded(), style: context.textTheme.titleLarge),
          const SizedBox(height: 16),
          Text('Enter current time in hh : mm format'.hardcoded(), style: context.textTheme.labelMedium),
          const SizedBox(height: 60),
          const _CurrentTime()
        ],
      ),
    );
  }
}

class _CurrentTime extends StatefulWidget {
  const _CurrentTime();

  @override
  State<_CurrentTime> createState() => _CurrentTimeState();
}

class _CurrentTimeState extends State<_CurrentTime> {
  @override
  void initState() {
    context.read<AuthTimerBloc>().add(const AuthTimerEventStart());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthTimerBloc, String>(
      builder: (context, state) {
        return Text(state, style: context.textTheme.displaySmall);
      },
    );
  }
}
