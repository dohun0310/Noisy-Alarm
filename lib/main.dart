import 'package:flutter/material.dart';

import 'package:noisyalarm/theme.dart';

import 'package:noisyalarm/pages/main/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      home: const TimerPage(),
    );
  }
}