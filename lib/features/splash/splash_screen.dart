import 'package:flutter/material.dart';
import 'package:test_task_make_it/core/navigation/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppRoute.login.go(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
