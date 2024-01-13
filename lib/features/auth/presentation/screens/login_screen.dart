import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:test_task_make_it/core/extensions/context_extensions.dart';
import 'package:test_task_make_it/core/extensions/string_extensions.dart';
import 'package:test_task_make_it/features/auth/logic/auth/auth_bloc.dart';
import 'package:test_task_make_it/features/auth/logic/auth_controllers/auth_controllers.dart';
import 'package:test_task_make_it/features/auth/logic/auth_timer/auth_timer_bloc.dart';
import 'package:test_task_make_it/features/auth/presentation/widgets/time_field_item.dart';

import '../../../../core/navigation/app_router.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final systemBottomsHeight = MediaQuery.paddingOf(context).bottom;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthTimerBloc(),
        ),
        Provider(
          create: (_) => AuthControllers(),
          dispose: (_, value) => value.dispose(),
        )
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthPassed) {
            AppRoute.creatingNotification.go(context);
          }
          if (state is AuthNotConfirmed) {
            context.showSnackBar('The time is wrong. Try again.'.hardcoded());
          }
        },
        child: Column(
          children: [
            Expanded(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                  title: Text('Log In'.hardcoded()),
                ),
                body: const _Body(),
              ),
            ),
            _ConfirmButton(systemBottomsHeight),
          ],
        ),
      ),
    );
  }
}

class _ConfirmButton extends StatelessWidget {
  const _ConfirmButton(this.systemBottomsHeight);

  final double systemBottomsHeight;

  @override
  Widget build(BuildContext context) {
    final controllers = context.read<AuthControllers>();
    return Material(
      child: Container(
        margin: EdgeInsets.fromLTRB(
          24,
          16,
          24,
          systemBottomsHeight + 16,
        ),
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            context.read<AuthBloc>().add(AuthEventConfirm(controllers.time));
          },
          child: BlocSelector<AuthBloc, AuthState, bool>(
            selector: (state) {
              return state is AuthLoading;
            },
            builder: (context, state) {
              if (state) {
                return const CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                );
              }
              return Text('Confirm'.hardcoded());
            },
          ),
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  @override
  void initState() {
    context.read<AuthTimerBloc>().add(const AuthTimerEventStart());
    context.read<AuthControllers>().init(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 80),
              Text('Log In'.hardcoded(), style: context.textTheme.titleLarge),
              const SizedBox(height: 16),
              Text('Enter current time in hh : mm format'.hardcoded(), style: context.textTheme.labelMedium),
              const SizedBox(height: 60),
              const _CurrentTime(),
              const SizedBox(height: 60),
              const _TimeField()
            ],
          ),
        ),
      ),
    );
  }
}

class _TimeField extends StatelessWidget {
  const _TimeField();

  @override
  Widget build(BuildContext context) {
    final controllers = context.read<AuthControllers>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TimeFieldItem(
          controller: controllers.controller1,
          focusNode: controllers.focusNode1,
          onChanged: controllers.onChanged1,
        ),
        const SizedBox(width: 12),
        TimeFieldItem(
          controller: controllers.controller2,
          focusNode: controllers.focusNode2,
          onChanged: controllers.onChanged2,
        ),
        const SizedBox(width: 12),
        Text(
          ':',
          style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary,
            fontSize: 33,
          ),
        ),
        const SizedBox(width: 12),
        TimeFieldItem(
          controller: controllers.controller3,
          focusNode: controllers.focusNode3,
          onChanged: controllers.onChanged3,
        ),
        const SizedBox(width: 12),
        TimeFieldItem(
          controller: controllers.controller4,
          focusNode: controllers.focusNode4,
          onChanged: controllers.onChanged4,
        ),
      ],
    );
  }
}

class _CurrentTime extends StatelessWidget {
  const _CurrentTime();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthTimerBloc, String>(
      builder: (context, state) {
        return Text(state, style: context.textTheme.displaySmall);
      },
    );
  }
}
