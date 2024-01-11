import 'package:flutter/material.dart';

import 'features/auth/presentation/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'test task MAKEIT',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF1E88E5),
          secondary: Color(0xFF00B0FF),
          surface: Color(0xFFffffff),
          background: Color(0xFFffffff),
          error: Color(0xFFB00020),
          onPrimary: Color(0xFFffffff),
          onSecondary: Color(0xFF000000),
          onSurface: Color(0xFF000000),
          onBackground: Color(0xFF000000),
          onError: Color(0xFFffffff),
          brightness: Brightness.light,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}
